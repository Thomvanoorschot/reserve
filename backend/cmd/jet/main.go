package main

import (
	"context"
	"database/sql"
	"fmt"
	"strconv"
	"strings"

	"github.com/go-jet/jet/v2/generator/metadata"
	"github.com/go-jet/jet/v2/generator/template"
	"github.com/go-jet/jet/v2/qrm"
	"github.com/go-jet/jet/v2/sqlite"
	_ "github.com/tursodatabase/libsql-client-go/libsql"
)

// TODO: Is there a way to call this function if main.go does not compile? Can we make a separate main file?

func main() {
	err := JetGen("test", "thomvanoorschot", "eyJhbGciOiJFZERTQSIsInR5cCI6IkpXVCJ9.eyJhIjoicnciLCJpYXQiOjE3MDk5OTk3MjUsImlkIjoiZmZlZTE4NGUtMThlOC00MDhlLWE3M2ItYWNmZDNhZThiN2Q4In0.Xh_Mcazu1mP5xfol9NZVND1NMoTCdySO3Y2-v5a6B24H1KGGxAv2k46P6L_icJnmAxtz6RVBA_TVmOZzp6eDAA")
	if err != nil {
		fmt.Println(err)
	}
}

func JetGen(dbName, organization, token string) error {
	generatorTemplate := template.Default(sqlite.Dialect)
	url := fmt.Sprintf("libsql://%s-%s.turso.io?authToken=%s", dbName, organization, token)

	db, err := sql.Open("libsql", url)

	schemaMetadata, err := metadata.GetSchema(db, &sqliteQuerySet{}, "")
	if err != nil {
		return fmt.Errorf("failed to query database metadata: %w", err)
	}

	err = template.ProcessSchema("./generated/jet_gen", schemaMetadata, generatorTemplate)
	if err != nil {
		return fmt.Errorf("failed to process database %s: %w", schemaMetadata.Name, err)
	}
	return nil
}

type sqliteQuerySet struct{}

func (p sqliteQuerySet) GetTablesMetaData(db *sql.DB, schemaName string, tableType metadata.TableType) ([]metadata.Table, error) {
	query := `
	SELECT name as "table.name" 
	FROM sqlite_master
	WHERE type=? AND name != 'sqlite_sequence'
	ORDER BY name;
`
	sqlTableType := "table"

	if tableType == metadata.ViewTable {
		sqlTableType = "view"
	}

	var tables []metadata.Table

	_, err := qrm.Query(context.Background(), db, query, []interface{}{sqlTableType}, &tables)
	if err != nil {
		return nil, fmt.Errorf("failed to query %s metadata: %w", schemaName, err)
	}

	for i := range tables {
		tables[i].Columns, err = p.GetTableColumnsMetaData(db, schemaName, tables[i].Name)
		if err != nil {
			return nil, fmt.Errorf("failed to query column metadata: %w", err)
		}
	}

	return tables, nil
}

func getTableInfoQuery(db *sql.DB) (string, error) {
	var version string
	err := db.QueryRow("select sqlite_version();").Scan(&version)

	if err != nil {
		return "", fmt.Errorf("failed to get sqlite version: %w", err)
	}

	sqliteVersion, err := VersionFromString(version)

	if err != nil {
		return "", fmt.Errorf("can't parse sqlite version: %w", err)
	}

	if sqliteVersion.Lt(Version{Major: 3, Minor: 26, Patch: 0}) {
		return `select * from pragma_table_info(?);`, nil
	}

	return `select * from pragma_table_xinfo(?);`, nil
}

func (p sqliteQuerySet) GetTableColumnsMetaData(db *sql.DB, _ string, tableName string) ([]metadata.Column, error) {

	tableInfoQuery, err := getTableInfoQuery(db)

	if err != nil {
		return nil, err
	}

	var columnInfos []struct {
		Name    string
		Type    string
		NotNull int32
		Pk      int32
		Hidden  int32
	}

	_, err = qrm.Query(context.Background(), db, tableInfoQuery, []interface{}{tableName}, &columnInfos)
	if err != nil {
		return nil, fmt.Errorf("failed to query '%s' column metadata: %w", tableName, err)
	}

	var columns []metadata.Column

	for _, columnInfo := range columnInfos {
		columnType := strings.TrimSuffix(getColumnType(columnInfo.Type), " GENERATED ALWAYS")
		isGenerated := columnInfo.Hidden == 2 || columnInfo.Hidden == 3 // stored or virtual column
		if columnType == "INTEGER" {
			columnType = "int8"
		}
		columns = append(columns, metadata.Column{
			Name:         columnInfo.Name,
			IsPrimaryKey: columnInfo.Pk != 0,
			IsNullable:   columnInfo.NotNull != 1,
			IsGenerated:  isGenerated,
			DataType: metadata.DataType{
				Name:       columnType,
				Kind:       metadata.BaseType,
				IsUnsigned: false,
			},
		})
	}

	return columns, nil
}

func getColumnType(columnType string) string {
	return strings.TrimSpace(strings.Split(columnType, "(")[0])
}

func (p sqliteQuerySet) GetEnumsMetaData(db *sql.DB, _ string) ([]metadata.Enum, error) {
	return nil, nil
}

type Version struct {
	Major int
	Minor int
	Patch int
}

func VersionFromString(version string) (Version, error) {
	parts := strings.Split(version, ".")

	var ret Version

	if len(parts) > 0 {
		major, err := strconv.Atoi(parts[0])

		if err != nil {
			return ret, fmt.Errorf("major is not a number: %w", err)
		}

		ret.Major = major
	}

	if len(parts) > 1 {
		minor, err := strconv.Atoi(parts[1])

		if err != nil {
			return ret, fmt.Errorf("minor is not a number: %w", err)
		}

		ret.Minor = minor
	}

	if len(parts) > 2 {
		patch, err := strconv.Atoi(parts[2])

		if err != nil {
			return ret, fmt.Errorf("patch is not a number: %w", err)
		}

		ret.Patch = patch
	}

	return ret, nil
}

func (v Version) Lt(version Version) bool {
	if v.Major < version.Major {
		return true
	}

	if v.Minor < version.Minor {
		return true
	}

	return v.Patch < version.Patch
}
