const express = require('express');
const app = express();
const path = require('path');
const routes = require('./routes/routes.js');

app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname + '/src/index.html'));
});

app.use('/api', routes);

app.use('/ressources', express.static('ressources'));

app.listen(3000, function() {
  console.log('Example app listening on port 3000!')
});