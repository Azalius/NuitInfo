const modeldashboard = require("../models/dashboard");
let async = require("async");

module.exports.GetDashboard = function (request, response) {
    if (request.params.id === undefined) {
        console.log("Erreur pas d'id personne");
        request.params.id = 1;
    }
    async.parallel([
            function (callback) {
                modeldashboard.getPersonne(request.params.id, function (err, result) {
                    callback(err, result[0]);
                });
            },
            function (callback) {
                modeldashboard.getBase(1, function (err, result) {
                    callback(err, result[1]);
                });
            },
            function (callback) {
                modeldashboard.getVehicule(1, function (err, result) {
                    callback(err, result[2]);
                });
            },
        ],
        function (err, result) {
            if (err) {
                console.log(err);
                return;
            }
            response.personne = result[0];
            response.base = result[1];
            response.vehicule = result[2];
            response.render('dashboard', response);
        }
    );
};