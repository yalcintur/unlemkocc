'use strict';


var mongoose = require('mongoose'),
  Dergi = mongoose.model('dergiler');

exports.list_all_dergiler = function(req, res) {
  Dergi.find({}, function(err, dergi) {
    if (err)
      res.send(err);
    res.json(dergi);
  });
};




exports.create_a_dergi = function(req, res) {
  var new_dergi = new Dergi(req.body);
  new_dergi.save(function(err, dergi) {
    if (err)
      res.send(err);
    res.json(dergi);
  });
};


exports.read_a_dergi = function(req, res) {
  Dergi.findById(req.params.dergiId, function(err,dergi) {
    if (err)
      res.send(err);
    res.json(dergi);
  });
};


exports.update_a_dergi = function(req, res) {
  Dergi.findOneAndUpdate({_id: req.params.dergiId}, req.body, {new: true}, function(err, dergi) {
    if (err)
      res.send(err);
    res.json(dergi);
  });
};


exports.delete_a_dergi = function(req, res) {


  Dergi.remove({
    _id: req.params.dergiId
  }, function(err, dergi) {
    if (err)
      res.send(err);
    res.json({ message: 'Dergi successfully deleted' });
  });
};
