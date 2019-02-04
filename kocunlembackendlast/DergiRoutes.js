let router = require('express').Router();

router.get('/', function (req, res) {
    res.json({
        status: 'API is working',
        message: 'Welcome to kocunlem',
    });
});

var dergiController = require('./dergiController');

router.route('/dergiler')
    .get(dergiController.index)
    .post(dergiController.new);

router.route('/dergiler/:dergi_id')
    .get(dergiController.view)
    .patch(dergiController.update)
    .put(dergiController.update)
    .delete(dergiController.delete);

module.exports = router;