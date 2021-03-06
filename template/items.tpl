<html>
  <head>
    <link rel="stylesheet" href="//cdn.rawgit.com/milligram/milligram/master/dist/milligram.min.css">
  </head>
  <body>
    <h1>Items</h1>
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>NAME</th>
          <th>PRICE</th>
          <th>DESCRIPTION</th>
          <th>ITYPE-ID</th>
        </tr>
      </thead>
      <tbody>
        {{range .}}
        <tr>
          <td>{{ .ID}}</td>
          <td>{{ .Name}}</td>
          <td>{{ .Price}}</td>
          <td>{{ .Description}}</td>
          <td>{{ .ITypeID}}</td>
        </tr>
        {{end}}
      </tbody>
    </table>
  </body>
</html>
