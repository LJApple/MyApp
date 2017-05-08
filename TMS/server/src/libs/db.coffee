Datastore = require('nedb')
config = require('./../config/config')

db = {}
dbPath = config.dbFilePath
console.log(dbPath)
db.users = new Datastore(dbPath + 'users.db')
db.users.loadDatabase();

db.tasks = new Datastore(dbPath + 'tasks.db')
db.tasks.loadDatabase();

#db.users.insert({username: 'admin', password: 'admin'})

#db.users =  new Datastore({ filename: 'path/to/datafile', autoload: true })

module.exports = db