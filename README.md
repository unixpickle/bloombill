# Usage

Using the Bloomberg Billionaire API is super easy. Simply fetch the list of Billionaires as follows:

    var fetch = require('bloombill').fetch;
    fetch(function(err, list) {
      // list is an array of people if error is non-null
    });

The people will have the following fields:

 * **name** - the name of the person
 * **net** - the net-worth of the person in USD
 * **last** - the net-gain of the person's net-worth in the last day
 * **ytd** - the net-gain of the person's net-worth since the beginning of the year
 * **last_rel** - the fraction of the person's net-worth contained by **last**
 * **ytd_rel** - like **last_rel**, but for **ytd**
