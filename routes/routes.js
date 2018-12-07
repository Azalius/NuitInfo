const express = require('express');
const router = express.Router();

// define the about route
router.get('/test', function(req, res) {
  res.send('salut');
});

module.exports = router;