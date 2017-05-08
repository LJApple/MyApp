app = require('./libs/app')
config = require('./config/config')
http = require('http')

port = config.port
server = http.createServer(app)

onError = (error) ->
  if error.syscall isnt 'listen'
    throw error
  bind = typeof port is 'string' ? 'Pipe ' + port: 'Port ' + port
  switch error.code
    when 'EACCES'
      console.error(bind + ' requires elevated privileges')
      process.exit(1)
    when 'EADDRINUSE'
      console.error(bind + ' is already in use');
      process.exit(1);
    else
      throw error

onListening = ()->
  addr = address()
  bind = typeof addr is 'string' ?  'pipe ' + addr: 'port ' + addr.port
  debug('Listening on ' + bind)

server.on('error', onError)
#server.on('listening', onListening)
server.listen(port, ->
  console.log('Started...', port)
)


