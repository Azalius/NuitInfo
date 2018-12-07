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

module.exports.getBase = function (id, callback) {
    db.getConnection(function (err, connexion) {
        if (err) {
            console.log(err);
            return;
        }
        let sql = "SELECT * FROM base b JOIN position_gps pg on b.position = pg.id WHERE b.id=?";
        connexion.query(sql, id, callback);
        connexion.release();
    });
};

module.exports.getVehicule = function (id, callback) {
    db.getConnection(function (err, connexion) {
        if (err) {
            console.log(err);
            return;
        }
        let sql = "SELECT * FROM vehicule WHERE id=?";
        connexion.query(sql, id, callback);
        connexion.release();
    });
};