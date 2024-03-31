package turso

import (
	"context"
	"database/sql"
	"errors"
	"fmt"
	"sync"
	"time"

	"reserve/clients/turso"
	"reserve/services"

	_ "github.com/tursodatabase/libsql-client-go/libsql"
)

const Organization = "thomvanoorschot" // TODO Temporary

type DbProvider interface {
	CreateDbToken(ctr turso.CreateDbTokenRequest) (tr string, err error)
}

type Repository struct {
	dbs        sync.Map
	dbProvider DbProvider
}

type Tx struct {
	*sql.Tx
}

func NewRepository(dbProvider DbProvider) *Repository {
	return &Repository{
		dbs:        sync.Map{},
		dbProvider: dbProvider,
	}
}

func (r *Repository) AddConnection(token, dbName string) (*sql.DB, error) {
	url := fmt.Sprintf("libsql://%s-%s.turso.io?authToken=%s", dbName, Organization, token)

	db, err := sql.Open("libsql", url)
	if err != nil {
		return nil, err
	}
	r.dbs.Store(dbName, db)
	return db, nil
}

func (r *Repository) db(ctx context.Context) (*sql.DB, error) {
	tenant, ok := ctx.Value("tenant").(string)
	if !ok {
		return nil, fmt.Errorf("need to specify tenant to access the database")
	}
	cachedDb, ok := r.dbs.Load(tenant)
	if ok {
		return cachedDb.(*sql.DB), nil
	}
	token, err := r.dbProvider.CreateDbToken(turso.CreateDbTokenRequest{
		Organization: Organization,
		DatabaseName: tenant,
		Expiration:   "24h",
	})

	// Removing almost expired key from cache
	go func() {
		<-time.NewTimer(23 * time.Hour).C
		r.dbs.Delete(tenant)
	}()
	if err != nil {
		return nil, err
	}
	return r.AddConnection(token, tenant)
}
func (r *Repository) Db(ctx context.Context) (services.QueryExecutor, error) {
	return r.db(ctx)
}

func (r *Repository) Tx(ctx context.Context) (services.TxQueryExecutor, error) {
	db, err := r.db(ctx)
	if err != nil {
		return nil, err
	}
	tx, err := db.BeginTx(ctx, nil)
	if err != nil {
		return nil, err
	}
	return Tx{tx}, nil
}

func (t Tx) Rollback() error {
	err := t.Tx.Rollback()
	if errors.Is(err, sql.ErrTxDone) {
		return nil
	}
	return err
}
func (t Tx) Commit() error {
	return t.Tx.Commit()
}
