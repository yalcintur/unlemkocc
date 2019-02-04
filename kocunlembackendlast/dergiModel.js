var mongoose = require('mongoose');

// Setup schema
var dergiSchema = mongoose.Schema({
    name: {
        type: String,
        required: true
    },
    dergiId: {
        type: Number,
        required: true
    },
    resim: {
        type: String,
        required: true
    },
    version: {
        type: Number,
        required: true
    },
    link: {
        type: String,
        required: true
    },
    create_date: {
        type: Date,
        default: Date.now
    }
});

var Dergi = module.exports = mongoose.model('dergi', dergiSchema);


module.exports.get = function (callback, limit) {
    Dergi.find(callback).limit(limit);
}