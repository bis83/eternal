package main

import (
  "net/http"
  "html/template"
  "io/ioutil"
  "encoding/json"
)

type UberData struct {
  ID              int     `json:"id"`
  Name            string  `json:"name"`
  Nickname        string  `json:"nickname"`
  Description     string  `json:"description"`
  ITypeID         int     `json:"itypeId"`
  ETypeID         int     `json:"etypeId"`
  WTypeID         int     `json:"wtypeId"`
  ATypeID         int     `json:"atypeId"`
  STypeID         int     `json:"stypeId"`
  Params          []int   `json:"params"`
  Price           int     `json:"price"`
  Traits          []struct {
    Code          int     `json:"code"`
    DataID        int     `json:"dataid"`
    Value         float32 `json:"value"`
  } `json:"traits"`
  Damage          struct {
    Critical      bool    `json:"critical"`
    ElementID     int     `json:"elementId"`
    Formula       string  `json:"formula"`
    Type          int     `json:"type"`
    Variance      int     `json:"variance"`
  } `json:"damage"`
  Effects         []struct {
    Code          int     `json:"code"`
    DataID        int     `json:"dataId"`
    Value1        float32 `json:"value1"`
    Value2        float32 `json:"value2"`
  } `json:"effects"`
  MPCost          int     `json:"mpCost"`
  TPCost          int     `json:"tpCost"`
  TPGain          int     `json:"tpGain"`
  Scope           int     `json:"scope"`
  HitType         int     `json:"hitType"`
  Occasion        int     `json:"occasion"`
  Repeats         int     `json:"repeats"`
  Speed           int     `json:"speed"`
  SuccessRate     int     `json:"successRate"`
  Members         []struct {
    EnemyID       int     `json:"enemyId"`
    X             int     `json:"x"`
    Y             int     `json:"y"`
    Hidden        bool    `json:"hidden"`
  } `json:"members"`
  Note            string  `json:"note"`
  Profile         string  `json:"profile"`
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
    if err := writeTemplate(w, pathTemplate, dat[1:]); err != nil {
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
  http.HandleFunc("/skills", makeHandler("/game/data/Skills.json", "template/skills.tpl"))
  http.HandleFunc("/items", makeHandler("/game/data/Items.json", "template/items.tpl"))
  http.HandleFunc("/armors", makeHandler("/game/data/Armors.json", "template/armors.tpl"))
  http.HandleFunc("/weapons", makeHandler("/game/data/Weapons.json", "template/weapons.tpl"))
  http.HandleFunc("/actors", makeHandler("/game/data/Actors.json", "template/actors.tpl"))
  http.HandleFunc("/enemies", makeHandler("/game/data/Enemies.json", "template/enemies.tpl"))
  http.HandleFunc("/troops", makeHandler("/game/data/Troops.json", "template/troops.tpl"))
  http.HandleFunc("/states", makeHandler("/game/data/States.json", "template/states.tpl"))
  http.HandleFunc("/animations", makeHandler("/game/data/Animations.json", "template/animations.tpl"))
  http.HandleFunc("/", indexHandler)
  http.ListenAndServe(":80", nil)
}
