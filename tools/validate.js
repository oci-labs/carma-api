
// Call as 'node validate.js <schema.json> <instance.json>'

var fs        = require('fs');
var validator = require('is-my-json-valid/require', { verbose: true, greedy: true});

var options = {
  "verbose": true,
  "echoArgs": true,
  "echoSchema": true,
  "echoInstance": true
};

var schemaFilename   = process.argv[2];
var instanceFilename = process.argv[3];

var readInstance = function(cb) {
  fs.readFile( instanceFilename, 'utf8', function (err, data) {
    if( cb && typeof (cb) === "function") {
      if(options.verbose) {
        console.log('read instance file: ' + instanceFilename);
      }

      if(options.echoInstance) {
        console.log('instance document(' + instanceFilename + '):');
        console.log(JSON.stringify(JSON.parse(data),null,2));
      }

      cb(data);

    } else {
      console.log("error: could not read the instance file: " + instanceFilename);
    }
  });
};

if(options.echoArgs) {
  process.argv.forEach( function(d,i) { console.log('Arg[' + i + '] == ' + d); });
}

readInstance( function(d) {
  var validate = validator(schemaFilename);
  if(options.echoSchema) {
    console.log('schema document(' + schemaFilename + '):');
    console.log(JSON.stringify(validate,null,2));
  }

  console.log('instance validates: ' + validate(JSON.parse(d)));
  if(validate.errors) { console.log(validate.errors); }
});

