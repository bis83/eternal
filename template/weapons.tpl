<html>
  <h1>Weapons</h1>
  <table>
    <tr>
      <th>ID</th>
      <th>NAME</th>
      <th>DESCRIPTION</th>
      <th>PRICE</th>
      <th>ETYPE-ID</th>
      <th>WTYPE-ID</th>
    </tr>
    {{range .}}
    <tr>
      <td>{{ .ID}}</td>
      <td>{{ .Name}}</td>
      <td>{{ .Description}}</td>
      <td>{{ .Price}}</td>
      <td>{{ .ETypeID}}</td>
      <td>{{ .WTypeID}}</td>
    </tr>
    {{end}}
</html>
