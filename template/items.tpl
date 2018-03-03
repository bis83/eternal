<html>
  <h1>Items</h1>
  <table>
    <tr>
      <th>ID</th>
      <th>NAME</th>
      <th>DESCRIPTION</th>
      <th>PRICE</th>
      <th>ITYPE-ID</th>
    </tr>
    {{range .}}
    <tr>
      <td>{{ .ID}}</td>
      <td>{{ .Name}}</td>
      <td>{{ .Description}}</td>
      <td>{{ .Price}}</td>
      <td>{{ .ITypeID}}</td>
    </tr>
    {{end}}
</html>
