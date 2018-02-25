package main

import "fmt"
import "net/http"

func hHelloWorld(w http.ResponseWriter, r *http.Request) {
  fmt.Fprint(w, "hello, world")
}

func main() {
  http.HandleFunc("/", hHelloWorld)
  http.Handle("/game/", http.StripPrefix("/game/", http.FileServer(http.Dir("/game"))))
  http.ListenAndServe(":5000", nil)
}
