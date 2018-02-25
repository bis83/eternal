package main

import "fmt"
import "net/http"

func hHelloWorld(w http.ResponseWriter, r *http.Request) {
  fmt.Fprint(w, "hello, world")
}

func main() {
  http.HandleFunc("/", hHelloWorld)
  http.ListenAndServe(":5000", nil)
}
