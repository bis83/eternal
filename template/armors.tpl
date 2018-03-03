<!DOCTYPE html>
<html>
  <body>
    <h1>Armors</h1>
    <table>
      <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>DESCRIPTION</th>
        <th>PRICE</th>
        <th>ETYPE-ID</th>
        <th>ATYPE-ID</th>
      </tr>
      {{range .}}
      <tr>
        <td>{{ .ID}} </td>
        <td>{{ .Name}}</td>
        <td>{{ .Description}}</td>
        <td>{{ .Price}}</td>
        <td>{{ .ETypeID}}</td>
        <td>{{ .ATypeID}}</td>
      </tr>
      {{end}}
    </table>
  </body>
</html>
