const passport = require("passport");

module.exports.login = async (req, res, next) => {
  //console.log('Inside POST /login callback')
  console.log(req.body);
  passport.authenticate("local", (err, user, info) => {
    req.login(user, (err) => {
      //console.log(req.session.passport, req.user)
      if (req.user) return res.json({ status: 1, u_id: req.user.u_id });
      else return res.json({ status: 0, msg: "帳號或密碼錯誤" });
    });
  })(req, res, next);
};

module.exports.logout = (req, res) => {
  req.logout();
  res.json({ status: 1, message: "success" });
};

module.exports.isLoggedIn = (req, res) => {
  console.log(req.isAuthenticated());
  res.json(req.isAuthenticated());
};
