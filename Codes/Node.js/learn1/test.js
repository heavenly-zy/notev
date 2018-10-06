'use strict';
var http = require('http');
// var funs = require('./modules/module1.js');
// var User = require('./modules/User');
var Teacher = require('./modules/Teacher');

http.createServer(function (request, response){
    response.writeHead(200, {'Content-Type': 'text/html; charset=utf-8'});
    if(request.url!=="/favicon.ico"){
        console.log('blabla');
        response.write('1111');
        // funs.fun1(response);
        // funs.fun2(response);
        // var user = new User(1, 'xxj', 19);
        // user.enter();
        var teacher = new Teacher(1, 'sss', 33);
        teacher.teach(response);
        response.end();
    }
}).listen(8000);
console.log('Server running at http://127.0.0.1:8000/');