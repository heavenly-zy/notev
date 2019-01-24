const axios = require("axios");

let [, url] = process.argv.splice(1);
if (!url) {
  url = "https://www.jianshu.com/p/7a9fbcbb1114";
}

axios
  .get(url)
  .then(function(response) {
    console.log(response.data);
  })
  .catch(function(error) {
    console.log(error);
  });
