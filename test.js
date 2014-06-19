var fetch = require('./index.js').fetch;
fetch(function(err, list) {
  console.log(err);
  console.log(list);
});