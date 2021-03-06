// Generated by CoffeeScript 1.10.0
(function() {
  var Datastore, config, db, dbPath;

  Datastore = require('nedb');

  config = require('./../config/config');

  db = {};

  dbPath = config.dbFilePath;

  console.log(dbPath);

  db.users = new Datastore(dbPath + 'users.db');

  db.users.loadDatabase();

  db.tasks = new Datastore(dbPath + 'tasks.db');

  db.tasks.loadDatabase();

  module.exports = db;

}).call(this);

//# sourceMappingURL=db.js.map
