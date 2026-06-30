package main

import (
	"fmt"
	"log"
	"net/http"
	"os"

	dotenv "github.com/joho/godotenv"
)

func main() {
	error := dotenv.Load("defaults.env")

	if error != nil {
		log.Fatal(error)
	}

	dotenv.Overload()

	port := os.Getenv("PORT")
	buildDirectory := os.Getenv("BUILD_DIRECTORY")

	fmt.Printf("Serving %s on localhost:%s...\n", buildDirectory, port)
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%s", port), http.FileServer(http.Dir(buildDirectory))))
}
