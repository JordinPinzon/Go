package main

import (
	"fmt"
	"net/http"
)

func helloWorld(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello World!")
}

func main() {
	http.HandleFunc("/", helloWorld)
	fmt.Println("Server running on http://localhost:8081")
	http.ListenAndServe(":8081", nil)
}
