var express = require("express");
var winston = require('winston');
var app = express();

var port = 9999;
var host = "127.0.0.1";

app.get("/module/:id", function(req, res) {
    res.send("OK " + id);
});

winston.info("Starting server:" + host + ":" + port);
app.listen(port, host);

