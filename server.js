let express = require('express'),
    exphbs = require('express-handlebars');

let app = express();

app.engine('handlebars', exphbs({defaultLayout: 'main'}));
app.set('view engine', 'handlebars');

app.use('/ressources', express.static('ressources'));

let DashboardController = require("./controllers/DashboardController");
app.get('/', DashboardController.Test);

app.listen(3000, function () {
    console.log('express-handlebars example server listening on: 3000');
});