const db = require('../configDb');

module.exports.getPersonne = function (id, callback) {
    db.getConnection(function (err, connexion) {
        if (err) {
            console.log(err);
            return;
        }
        let sql = "SELECT * FROM personne where id=?";
        connexion.query(sql, id, callback);
        connexion.release();
    });
};