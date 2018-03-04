<html>
  <head>
    <link rel="stylesheet" href="//cdn.rawgit.com/milligram/milligram/master/dist/milligram.min.css">
  </head>
  <body>
    <h1>Troops</h1>
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>NAME</th>
          <th>MEMBERS</th>
        </tr>
      </thead>
      <tbody>
        {{range .}}
        <tr>
          <td>{{ .ID}}</td>
          <td>{{ .Name}}</td>
          <td>
          {{range .Members}}
          {{ .EnemyID}},
          {{end}}
          </td>
        </tr>
        {{end}}
      </tbody>
    </table>
  </body>
</html>
