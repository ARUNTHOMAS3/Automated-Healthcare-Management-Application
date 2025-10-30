const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send(`
    <html>
      <head>
        <title>Healthcare Application</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            margin: 40px;
            text-align: center;
          }
          h1 {
            color: #0066cc;
          }
        </style>
      </head>
      <body>
        <h1>Welcome to Healthcare Application</h1>
        <p>The application is running successfully!</p>
        <p>Server Time: ${new Date().toLocaleString()}</p>
      </body>
    </html>
  `);
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});