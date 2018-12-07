var express = require('express');
var router = express.Router();

// define the about route
router.get('/test', function(req, res) {
  res.send('salut');
});

module.exports = router;