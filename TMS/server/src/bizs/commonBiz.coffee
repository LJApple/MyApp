db = require('./../libs/db')

module.exports = {
  setUserInfo: (req, res, next) ->
    token = req.headers['x-token']
    db.users.findOne({token: token, expiredTime: {$gt: Date.now()}}, (err, user) ->
      req.userInfo = user if not err
      next()
    )
  validateUserInfo: (req, res, next) ->
    if not req.userInfo
      res.status(401)
      return res.send('未授权')
    next()

}