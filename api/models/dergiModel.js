'use strict';
var mongoose = require('mongoose');
var Schema = mongoose.Schema;


var dergiSchema = new Schema({
  name: {
    type: String,
    required: true
  },
  pdf:{
      type: String,
      required: true
      },
  info:{
        type: String,
        required: true
       },
  Created_date: {
    type: Date,
    default: Date.now
  }
});

module.exports = mongoose.model('dergiler', dergiSchema);