const axios = require('axios');

let [, url] = process.argv.splice(1);

axios.get('https://www.jianshu.com/p/7a9fbcbb1114')
  .then(function (response) {
    console.log(response.data);
  })
  .catch(function (error) {
    console.log(error);
  });

console.log(1111111);