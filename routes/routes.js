let test = require("../controllers/DashboardController");

module.exports = function (app) {
    app.get('/', test.GetDashboard);
};