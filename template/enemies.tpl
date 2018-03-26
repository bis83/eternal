<html>
  <head>
    <link rel="stylesheet" href="//cdn.rawgit.com/milligram/milligram/master/dist/milligram.min.css">
  </head>
  <body>
    <h1>Enemies</h1>
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>NAME</th>
          <th>MAX-HP</th>
          <th>MAX-MP</th>
          <th>ATK</th>
          <th>DEF</th>
          <th>MAT</th>
          <th>MDF</th>
          <th>AGI</th>
          <th>LUK</th>
          <th>GOLD</th>
          <th>EXP</th>
        </tr>
      </thead>
      <tbody>
        {{range .}}
        <tr>
          <td>{{ .ID}}</td>
          <td>{{ .Name}}</td>
          {{range .Params}}
          <td>{{ . }}</td>
          {{end}}
          <td>{{ .Gold}}</td>
          <td>{{ .EXP}}</th>
        </tr>
        {{end}}
      </tbody>
    </table>
  </body>
</html>
