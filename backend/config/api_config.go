package config

import (
	"fmt"
	"log"
	"sync"

	"github.com/joho/godotenv"

	"github.com/kelseyhightower/envconfig"
)

type ApiConfig struct {
	APIPort       string `envconfig:"API_PORT" default:"8080"`
	MigrationsDir string `envconfig:"MIGRATIONS_DIR"`
}

var apiConfig *ApiConfig
var apiOnce sync.Once

func LoadApiConfig() *ApiConfig {
	apiOnce.Do(func() {
		loadApiConfig()
	})

	return apiConfig
}

func loadApiConfig() {
	err := godotenv.Load()
	if err != nil {
		fmt.Println("Could not find a .env file (can be ignored when not in local dev mode")
	}

	apiConfig = new(ApiConfig)
	if err := envconfig.Process("", apiConfig); err != nil {
		log.Fatal(err)
	}
}
