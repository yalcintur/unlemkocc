Dergi = require('./dergiModel');

exports.index = function (req, res) {
    Dergi.get(function (err, dergiler) {
        if (err) {
            res.json({
                status: "error",
                message: err,
            });
        }
        res.json({
            status: "success",
            message: "Dergiler basariyla alindi",
            data: dergiler
        });
    });
};

exports.new = function (req, res) {
    var dergi = new Dergi();
    dergi.name = req.body.name,
    dergi.dergiId = req.body.dergiId;
    dergi.resim = req.body.resim;
    dergi.version = req.body.version;
    dergi.link = req.body.link;

    dergi.save(function (err) {

        res.json({
            message: 'Dergi Olusturuldu',
            data: dergi
        });
    });
};

exports.view = function (req, res) {
        Dergi.findById(req.params.dergi_id, function (err, dergi) {
        if (err)
            res.send(err);
        res.json({
            message: 'Dergi bilgileri fetchlendi',
            data: dergi
        });
    });
};

exports.update = function (req, res) {

    Dergi.findById(req.params.dergi_id, function (err, dergi) {
        if (err)
            res.send(err);

            dergi.name = req.body.name,
            dergi.dergiId = req.body.dergiId;
            dergi.resim = req.body.resim;
            dergi.version = req.body.version;
            dergi.link = req.body.link;        

        dergi.save(function (err) {
            if (err)
                res.json(err);
            res.json({
                message: 'Dergi bilgisi guncellendi',
                data: dergi
            });
        });
    });
};

exports.delete = function (req, res) {
    Dergi.remove({
        _id: req.params.dergi_id
    }, function (err, dergi) {
        if (err)
            res.send(err);

        res.json({
            status: "success",
            message: 'Dergi Silindi'
        });
    });
};