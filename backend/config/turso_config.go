package config

import (
	"fmt"
	"log"
	"sync"

	"github.com/joho/godotenv"

	"github.com/kelseyhightower/envconfig"
)

type TursoConfig struct {
	URI                       string `envconfig:"TURSO_URI" default:"https://api.turso.tech/v1"`
	ReadTimeout               string `envconfig:"TURSO_READ_TIMEOUT" default:"60000ms"`
	WriteTimeout              string `envconfig:"TURSO_WRITE_TIMEOUT" default:"60000ms"`
	MaxIdleConnectionDuration string `envconfig:"TURSO_MAX_IDLE_CONNECTION_DURATION" default:"1h"`
	APIToken                  string `envconfig:"TURSO_API_TOKEN"`
}

var tursoConfig *TursoConfig
var tursoOnce sync.Once

func LoadTursoConfig() *TursoConfig {
	tursoOnce.Do(func() {
		loadTursoConfig()
	})

	return tursoConfig
}

func loadTursoConfig() {
	err := godotenv.Load()
	if err != nil {
		fmt.Println("Could not find a .env file (can be ignored when not in local dev mode")
	}

	tursoConfig = new(TursoConfig)
	if err := envconfig.Process("", tursoConfig); err != nil {
		log.Fatal(err)
	}
}
