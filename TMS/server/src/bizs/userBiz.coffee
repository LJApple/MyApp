jwt = require('jsonwebtoken')
config = require('./../config/config')
db = require('./../libs/db')


validUserExists = (req, res, next) ->
  body = req.body
  return next(new Error('请提交用户注册信息。')) if not body or not body.username or not body.password
  db.users.findOne({username: body.username}, (err, user) ->
    return next(err) if err
    if user
      return next(new Error('用户已注册，无法再次注册！'))
    next()
  )

register = (req, res, next) ->
  body = req.body
  # 正常注册
  postData = {
    username: body.username
    password: body.password
    token: ''
    expiredTime: Date.now()
  }
  db.users.insert(postData, (err, user) ->
    return next(err) if err
    res.json(true)
  )

login = (req, res, next) ->
  username = req.body.username
  password = req.body.password
  db.users.findOne({username: username, password: password}, (err, user)->
    return next(err) if err
    return next(new Error('登录失败，请重试！未找到用户信息！')) if !user
    token = jwt.sign({username: username}, config.secret)
    expiredTime = Date.now() + 1000*60*60*24
    db.users.update({_id: user._id}, {$set: {token: token, expiredTime: expiredTime}},
      (err, numReplaced) ->
        return next(err) if err
        return next(new Error('登录失败，请重试！')) if numReplaced is 0
        res.json({token: token})
    )
  )

module.exports = {
  validUserExists: validUserExists
  register: register
  login: login
}