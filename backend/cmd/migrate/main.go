package main

import (
	"database/sql"
	"fmt"

	"reserve/migrations"

	_ "github.com/tursodatabase/libsql-client-go/libsql"
)

// TODO: Is there a way to call this function if main.go does not compile? Can we make a separate main file?

func main() {
	url := fmt.Sprintf("libsql://%s-%s.turso.io?authToken=%s", "test", "thomvanoorschot", "eyJhbGciOiJFZERTQSIsInR5cCI6IkpXVCJ9.eyJhIjoicnciLCJpYXQiOjE3MDk5OTk3MjUsImlkIjoiZmZlZTE4NGUtMThlOC00MDhlLWE3M2ItYWNmZDNhZThiN2Q4In0.Xh_Mcazu1mP5xfol9NZVND1NMoTCdySO3Y2-v5a6B24H1KGGxAv2k46P6L_icJnmAxtz6RVBA_TVmOZzp6eDAA")

	db, err := sql.Open("libsql", url)

	m := migrations.NewMigrator()
	err = m.Migrate(db)
	if err != nil {
		fmt.Println(err)
	}
}
