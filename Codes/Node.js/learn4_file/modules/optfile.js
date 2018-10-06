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
    writefileSync: function(path, data){
        fs.writeFileSync(path, data);
        console.log('同步写文件完成！');
    },
    writefile: function(path, data, recall){
        fs.writeFile(path, data, function(err){
            if (err){
                throw err;
            }
            console.log('It\'s saved!');
            recall('写文件成功');
        })
    },
}