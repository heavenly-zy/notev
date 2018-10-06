var User = require('./User');

function Teacher(id, name, age){
    User.apply(this, [id, name, age]);
    this.teach = function(res){
        res.write(this.name + 'is teaching...');
    }
}

module.exports = Teacher;