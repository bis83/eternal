<html>
  <head>
    <link rel="stylesheet" href="//cdn.rawgit.com/milligram/milligram/master/dist/milligram.min.css">
  </head>
  <body>
    <h1>Actors</h1>
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>NAME</th>
          <th>NICKNAME</th>
          <th>PROFILE</th>
          <th>NOTE</th>
        </tr>
      </thead>
      <tbody>
        {{range .}}
        <tr>
          <td>{{ .ID}}</td>
          <td>{{ .Name}}</td>
          <td>{{ .Nickname}}</td>
          <td>{{ .Profile}}</td>
          <td>{{ .Note}}</td>
        </tr>
        {{end}}
      </tbody>
    </table>
  </body>
</html>
