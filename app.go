package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	fmt.Println("Serving build/ on localhost:3000...")
	log.Fatal(http.ListenAndServe(":3000", http.FileServer(http.Dir("build/"))))
}
