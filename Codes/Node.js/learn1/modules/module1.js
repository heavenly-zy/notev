'use strict';

module.exports = {
    fun1 : function(res){
        console.log('fun1');
        res.write('fun1');
    },
    fun2 : function(res){
        console.log('fun2');
        res.write('fun2');
    }
}