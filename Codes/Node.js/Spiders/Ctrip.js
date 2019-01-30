"use strict";

var fs = require("fs");
var request = require("request");
var http = require("http");
var keyword = "Java";

var requestData = {
  acity: "DLC",
  dcity: "TAO",
  flightWay: "Oneway"
};

var option = {
  url: "https://flights.ctrip.com/itinerary/api/12808/lowestPrice",
  method: "POST",
  json: true,
  headers: {
    "content-type": "application/json",
    "User-Agent":
      "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36"
  },
  body: requestData
};

function clawer() {
  var info = request(option, function(err, response, body) {
    if (!err && response.statusCode == 200) {
      let lowestPrice = 99999;
      let prices = body.data.oneWayPrice;
      let lowestDay;
      for (let ownList of prices) {
        for (let day in ownList) {
          if (ownList[day] < lowestPrice) {
            lowestPrice = ownList[day];
            lowestDay = day;
          }
        }
      }
      console.log(`最低价出现在${lowestDay}，为${lowestPrice}`);
    } else {
      console.error(err);
    }
  });
}

clawer();
