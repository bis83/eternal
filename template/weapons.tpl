<html>
  <h1>Weapons</h1>
  <table>
    <tr>
      <th>ID</th>
      <th>NAME</th>
      <th>DESCRIPTION</th>
    </tr>
    {{range .}}
    <tr>
      <td>{{ .ID}}</td>
      <td>{{ .Name}}</td>
      <td>{{ .Description}}</td>
    </tr>
    {{end}}
</html>
