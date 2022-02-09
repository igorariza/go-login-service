package storage

import (
	"fmt"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"log"
	"os"
)

//var bdPostgresCN = ConnectToDB()

type vaultServiceConfig struct {
}

func Config() vaultServiceConfig {
	return vaultServiceConfig{}
}

func (vaultServiceConfig) PostgresHost() string {
	host := os.Getenv("DB_HOST")
	if host != "" {
		return host
	}
	return "localhost"
}

func (vaultServiceConfig) PostgresUser() string {
	user := os.Getenv("DB_USER")
	if user != "" {
		return user
	}
	return "admin"
}

func (vaultServiceConfig) PostgresPass() string {
	pass := os.Getenv("DB_PASSWORD")
	if pass != "" {
		return pass
	}
	return "admin"
}
func (vaultServiceConfig) PostgresPort() string {
	port := os.Getenv("DB_PORT")
	if port != "" {
		return port
	}
	return "5432"
}
func (vaultServiceConfig) PostgresDatabase() string {
	database := os.Getenv("DB_NAME")
	if database != "" {
		return database
	}
	return "ccp-vault"
}
func (vaultServiceConfig) PostgresSslMode() string {
	sslMode := os.Getenv("DB_SSL_MODE")
	if sslMode != "" {
		return sslMode
	}
	return "disable"
}

func (vaultServiceConfig) PostgresTimezone() string {
	timezone := os.Getenv("DB_TIMEZONE")
	if timezone != "" {
		return timezone
	}
	return "Etc/UTC"
}

//ConnectToDB func connect generic comment
func ConnectToDB() *gorm.DB {

	pgConnString := fmt.Sprintf("host=%s port=%s dbname=%s user=%s password=%s sslmode=%s TimeZone=%s",
		vaultServiceConfig{}.PostgresHost(),
		vaultServiceConfig{}.PostgresPort(),
		vaultServiceConfig{}.PostgresDatabase(),
		vaultServiceConfig{}.PostgresUser(),
		vaultServiceConfig{}.PostgresPass(),
		vaultServiceConfig{}.PostgresSslMode(),
		vaultServiceConfig{}.PostgresTimezone(),
	)
	//Connect to DB
	var DB *gorm.DB
	var err error

	DB, err = gorm.Open(postgres.Open(pgConnString), &gorm.Config{FullSaveAssociations: true})
	if err != nil {
		log.Fatal(err)
	}

	if err != nil {
		log.Fatalf("Error in connect the DB %v", err)
		return nil
	}
	// if err = DB.DB().Ping(); err != nil {
	// 	// log.Fatalf("Failed to ping DB via %s: %v", connURL, err.Error())
	// 	log.Println("Failed to ping a BD" + err.Error())
	// }

	log.Println("DB connected")
	return DB

}

//ChequeoConnection comment generic
func ChequeoConnection() int {
	return 1
}
