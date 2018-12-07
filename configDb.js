let mysql = require('mysql'); // voir https://github.com/felixge/node-mysql/

let pool = mysql.createPool({
    host: '51.75.90.197',
    user: 'chirac',
    password: 'pomme',
    database: 'namib',
    port: 3306
});

module.exports.getConnection = function (callback) {
    pool.getConnection(function (err, connection) {
        callback(err, connection);
    });
};