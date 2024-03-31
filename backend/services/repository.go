package services

import (
	"context"
	"database/sql"
)

type TxQueryExecutor interface {
	Commit() error
	Rollback() error
	QueryExecutor
}

type QueryExecutor interface {
	Query(query string, args ...any) (*sql.Rows, error)
	QueryRow(query string, args ...any) *sql.Row
	Exec(query string, args ...any) (sql.Result, error)
}

type BaseRepository interface {
	Tx(ctx context.Context) (TxQueryExecutor, error)
	Db(ctx context.Context) (QueryExecutor, error)
}
