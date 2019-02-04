let express = require('express');
let bodyParser = require('body-parser');
let mongoose = require('mongoose');
let app = express();
let apiRoutes = require("./DergiRoutes")

app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());

mongoose.connect('mongodb://yalcintur:kocUnlem@unlem-shard-00-00-zv4ng.gcp.mongodb.net:27017,unlem-shard-00-01-zv4ng.gcp.mongodb.net:27017,unlem-shard-00-02-zv4ng.gcp.mongodb.net:27017/test?ssl=true&replicaSet=Unlem-shard-0&authSource=admin&retryWrites=true');

var db = mongoose.connection;

var port = process.env.PORT || 8080;


app.get('/', (req, res) => res.send('Hello World with Express'));

app.use('/api', apiRoutes);

app.use((req, res, next) => {
    const error = new Error('Not Found!');
    error.status = 404;
    next(error);
  });

app.listen(port, function () {
    console.log("Running KocUnlem on port " + port);
});