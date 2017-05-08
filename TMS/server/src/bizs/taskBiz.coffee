jwt = require('jsonwebtoken')
config = require('./../config/config')
db = require('./../libs/db')

addTask = (req, res, next) ->
  body = req.body
  data = {
    creator: 'xx'
    taskName: body.taskName
    creatorDate: Date.now()
    updateDate: Date.now()
    status: '未完成'
    deleted: false
  }
  db.tasks.insert(data, (err, task) ->
    return next(err) if err
    return next('创建任务失败，请重试') if !task
    res.json(true)
  )

updateTask = (req, res, next) ->
  body = req.body
  db.tasks.findOne({_id: body._id}, (err, task) ->
    return next(err) if err
    return next('未找到要更新的task') if !task
    db.tasks.update({_id: task._id}, {$set: {
        taskName: body.taskName
        updateDate: Date.now()
        status: body.status
        deleted: body.deleted || false
    }}, (err, numReplaced) ->
      return next(err) if err
      return next('更新失败，请重试') if numReplaced is 0
      res.json(true)
    )
  )

getTask = (req, res, next) ->
  taskId = req.params.id
  db.tasks.findOne({_id: taskId}, (err, task) ->
    return next(err) if err
    res.json(task)
  )

getTasks = (req, res, next) ->
  console.log(req.userInfo)
  db.tasks.find({deleted: false, creator: 'xx'}, (err, tasks) ->
    return next(err) if err
    res.json(tasks)
  )

module.exports = {
  addTask: addTask
  updateTask: updateTask
  getTask: getTask
  getTasks: getTasks
}