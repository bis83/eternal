package main

import "net/http"

func main() {
  http.Handle("/game/", http.StripPrefix("/game/", http.FileServer(http.Dir("/game"))))
  http.ListenAndServe(":80", nil)
}
