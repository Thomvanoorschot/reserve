package turso

import (
	"database/sql"
	"fmt"
	"sync"
	"time"

	"reserve/clients/turso"

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

func (r *Repository) Db(tenant string) (*sql.DB, error) {
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
