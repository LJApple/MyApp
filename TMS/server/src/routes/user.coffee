express = require('express')
router = express.Router()
userBiz = require('./../bizs/userBiz')

router.post(
  '/user/register'
  userBiz.validUserExists
  userBiz.register
  )

router.post(
  '/user/login'
  userBiz.login
)

# Export
module.exports = router