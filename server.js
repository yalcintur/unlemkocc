var express = require('express'),
  app = express(),
  port = process.env.PORT || 3000,
  mongoose = require('mongoose'),
  Dergi = require('./api/models/dergiModel'), 
  bodyParser = require('body-parser');
  
mongoose.Promise = global.Promise;
mongoose.connect('mongodb://yalcintur:123123123q@unlem-shard-00-00-zv4ng.gcp.mongodb.net:27017,unlem-shard-00-01-zv4ng.gcp.mongodb.net:27017,unlem-shard-00-02-zv4ng.gcp.mongodb.net:27017/test?ssl=true&replicaSet=Unlem-shard-0&authSource=admin&retryWrites=true'); 


app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());


var routes = require('./api/routes/dergiRoutes');
routes(app); 


app.listen(port);


console.log('Dergi RESTful API server started on: ' + port);
