'use strict';
module.exports = function(app) {
  var dergiList = require('../controllers/dergiController');

  app.route('/dergiler')
    .get(dergiList.list_all_dergiler)
    .post(dergiList.create_a_dergi);


  app.route('/dergiler/:dergiId')
    .get(dergiList.read_a_dergi)
    .put(dergiList.update_a_dergi)
    .delete(dergiList.delete_a_dergi);
};
