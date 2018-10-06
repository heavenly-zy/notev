var fs = require('fs');

module.exports = {
    readfileSync: function(path){
        var data = fs.readFileSync(path, 'utf-8');
        console.log('同步读取完毕！');
        return data;
    },
    readfile: function(path, recall){
        fs.readFile(path, function(err, data){
            if(err){
                console.log(err);
            }else{
                console.log(data.toString());
                recall(data);
            }
        });
        console.log('异步执行完毕！');
    },
}