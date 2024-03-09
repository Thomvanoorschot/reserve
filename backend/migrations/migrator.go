package migrations

import (
	"database/sql"

	"reserve/config"

	"github.com/golang-migrate/migrate/v4"
	"github.com/golang-migrate/migrate/v4/database/sqlite3"
	"github.com/golang-migrate/migrate/v4/source/file"
	_ "github.com/mattn/go-sqlite3"
)

type Migrator struct {
}

func NewMigrator() *Migrator {
	return &Migrator{}
}

func (m *Migrator) Migrate(db *sql.DB) error {
	driver, err := sqlite3.WithInstance(db, &sqlite3.Config{})
	if err != nil {
		return err
	}
	cfg := config.LoadApiConfig()
	fileSource, err := (&file.File{}).Open(cfg.MigrationsDir)

	mgr, err := migrate.NewWithInstance(
		"file",
		fileSource,
		"test",
		driver)
	return mgr.Up()
}
