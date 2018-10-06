'use strict';
var optfile = require('./modules/optfile');

module.exports = {
    login : function(req, res){
        function recall(data){
            res.write(data);
            res.end();
        }
        optfile.readfile('./views/login.html', recall);
    },
    signup : function(req, res){
        res.write('signup');
    },
    writefile: function(req, res){
        function recall(data){
            res.write(data);
            res.end();
        }
        optfile.writefile('./views/one.txt', '我的写入文件', recall);
    }
}