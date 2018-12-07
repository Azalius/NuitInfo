/*
const express = require('express');
const router = express.Router();

const mysql = require('mysql');
const connection = mysql.createConnection({
  host: '51.75.90.197',
  user: 'chirac',
  password: 'pomme',
  database: 'namib'
});

connection.connect();

data = {};

router.get('/personne/:id', function (req, res) {
    let id = req.params.id;
    connection.query('SELECT * FROM `personne` WHERE id = ' + id, function (error, results, fields) {
        if (error) throw error;
        data.personne = results[0];
    });
    data.test = "COUCOU TOI";
    res.send(data);
});

module.exports = router;*/

let test = require("../controllers/DashboardController");

module.exports = function (app) {
    app.get('/', test.Test);
};