const modeldashboard = require("../models/dashboard");

module.exports.GetPersonne = function (request, response) {
    response.title = 'Seul dans l\'AMIB';
    modeldashboard.getPersonne(1, function (err, result) {
        if (err) {
            console.log(err);
            return;
        }
        response.personne = result[0];
        response.render('dashboard', response);
    });
};

module.exports.GetBase
module.exports.GetVehicule