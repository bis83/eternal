<html>
  <head>
    <link rel="stylesheet" href="//cdn.rawgit.com/milligram/milligram/master/dist/milligram.min.css">
  </head>
  <body>
    <h1>Weapons</h1>
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>NAME</th>
          <th>PRICE</th>
          <th>MAX-HP</th>
          <th>MAX-MP</th>
          <th>ATK</th>
          <th>DEF</th>
          <th>MAT</th>
          <th>MDF</th>
          <th>AGI</th>
          <th>LUK</th>
          <th>DESCRIPTION</th>
          <th>ETYPE-ID</th>
          <th>WTYPE-ID</th>
        </tr>
      </thead>
      <tbody>
        {{range .}}
        <tr>
          <td>{{ .ID}}</td>
          <td>{{ .Name}}</td>
          <td>{{ .Price}}</td>
          {{range .Params}}
          <td>{{ . }}</td>
          {{end}}
          <td>{{ .Description}}</td>
          <td>{{ .ETypeID}}</td>
          <td>{{ .WTypeID}}</td>
        </tr>
        {{end}}
      </tbody>
    </table>
  </body>
</html>
