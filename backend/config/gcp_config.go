package config

import (
	"fmt"
	"log"
	"sync"

	"github.com/joho/godotenv"

	"github.com/kelseyhightower/envconfig"
)

type GCPConfig struct {
	ServiceAccountFilePath string `envconfig:"ServiceAccountFilePath" default:"clients/gcpfirebase/reserve-staging-serviceaccount.json"`
}

var gcpConfig *GCPConfig
var gcpOnce sync.Once

func LoadGCPConfig() *GCPConfig {
	gcpOnce.Do(func() {
		loadGCPConfig()
	})

	return gcpConfig
}

func loadGCPConfig() {
	err := godotenv.Load()
	if err != nil {
		fmt.Println("Could not find a .env file (can be ignored when not in local dev mode")
	}

	gcpConfig = new(GCPConfig)
	if err := envconfig.Process("", gcpConfig); err != nil {
		log.Fatal(err)
	}
}
