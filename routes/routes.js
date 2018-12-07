<<<<<<< HEAD
var express = require('express');
var router = express.Router();
//const connection = require('../db/db')
=======
const express = require('express');
const router = express.Router();
>>>>>>> fee0801e3b6ead0abc1d1b5ed969e74e2e8797e5

var mysql = require('mysql');
var connection = mysql.createConnection({
  host: '51.75.90.197',
  user: '',
  password: '',
  database: 'namib'
});

connection.connect();

data = {};




router.get('/personne/:id', function(req, res) {
  let id = req.params.id;
  connection.query('SELECT * FROM `personne` WHERE id = ' + id, function(error, results, fields) {
    if (error) throw error;
    data.personne = results[0];
  });
  res.send(data);
});



module.exports = router;