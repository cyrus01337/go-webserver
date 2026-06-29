package main

import (
	"fmt"
	"log"
	"net/http"
	"os"

	"github.com/joho/godotenv"
)

func serveHomePage(writer http.ResponseWriter, request *http.Request) {
	body, error := os.ReadFile("index.html")

	if error != nil {
		body = []byte(error.Error())
	}

	fmt.Fprintf(writer, string(body))
}

func main() {
	port := os.Getenv("PORT")

	if err := godotenv.Load(".env"); err != nil {
		port = "3000"
	}

	http.HandleFunc("/", serveHomePage)
	fmt.Printf("Listening to localhost:%s...\n", port)
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%s", port), nil))
}
