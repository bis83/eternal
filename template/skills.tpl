<html>
  <head>
    <link rel="stylesheet" href="//cdn.rawgit.com/milligram/milligram/master/dist/milligram.min.css">
  </head>
  <body>
    <h1>Skills</h1>
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>NAME</th>
          <th>MP-COST</th>
          <th>TP-COST</th>
          <th>TP-GAIN</th>
          <th>DESCRIPTION</th>
          <th>NOTE</th>
        </tr>
      </thead>
      <tbody>
        {{range .}}
        <tr>
          <td>{{ .ID}}</td>
          <td>{{ .Name}}</td>
          <td>{{ .MPCost}}</td>
          <td>{{ .TPCost}}</td>
          <td>{{ .TPGain}}</td>
          <td>{{ .Description}}</td>
          <td>{{ .Note}}</td>
        </tr>
        {{end}}
      </tbody>
    </table>
  </body>
</html>
