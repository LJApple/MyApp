express = require('express')
path = require('path')
logger = require('morgan')
bodyParser = require('body-parser')
cors = require('cors')

apiRouters = require('./../routes/api')
userRouters = require('./../routes/user')
taskRouters = require('./../routes/task')

app = express()

app.use(logger('dev'))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: false}))

app.use(cors())

app.use('/api', apiRouters)
app.use('/api', userRouters)
app.use('/api', taskRouters)

# catch 404 and forward to error handler
app.use((req, res, next) ->
  err = new Error('Not Found')
  err.status = 404
  next(err)
)

#  error handlers

# will print stacktrace
app.use((err, req, res, next) ->
  res.send(err.status || 500, {
    message: err.message
    error: err
  })
)

module.exports = app
