package main

import (
  "net/http"
  "html/template"
  "io/ioutil"
  "encoding/json"
)

type UberData struct {
  ID          int     `json:"id"`
  Name        string  `json:"name"`
  Description string  `json:"description"`
}

func writeTemplate(w http.ResponseWriter, tpl string, dat interface{}) error {
  t, err := template.ParseFiles(tpl)
  if err != nil {
    return err
  }
  if err := t.Execute(w, dat); err != nil {
    return err
  }
  return nil
}

func readJSON(path string) ([]UberData, error) {
  var dat []UberData
  bytes, err := ioutil.ReadFile(path)
  if err != nil {
    return dat, err
  }
  if err := json.Unmarshal(bytes, &dat); err != nil {
    return dat, err
  }
  return dat, nil
}

func makeHandler(pathJSON string, pathTemplate string) http.HandlerFunc {
  return func(w http.ResponseWriter, r *http.Request) {
    dat, err := readJSON(pathJSON)
    if err != nil {
      panic(err)
    }
    if err := writeTemplate(w, pathTemplate, dat); err != nil {
      panic(err)
    }
  }
}

func indexHandler(w http.ResponseWriter, r *http.Request) {
  if err := writeTemplate(w, "template/index.tpl", nil); err != nil {
    panic(err)
  }
}

func main() {
  http.Handle("/game/", http.StripPrefix("/game/", http.FileServer(http.Dir("/game"))))
  http.HandleFunc("/armors", makeHandler("/game/data/Armors.json", "template/armors.tpl"))
  http.HandleFunc("/", indexHandler)
  http.ListenAndServe(":80", nil)
}
