const passport = require("passport");
const twofactor = require("node-2fa");

module.exports.login = async (req, res, next) => {
  console.log(req.body);
  passport.authenticate("local", (err, user, info) => {
    req.login(user, (err) => {
      if (req.user && req.user.totp === null) {
        return res.json({ status: 1, u_id: req.user.u_id });
      }
      if (req.user && req.user.totp !== null) {
        const delta = twofactor.verifyToken(req.user.totp, req.body.totp);
        console.log(delta);
        if (delta === null) {
          console.log("兩步驟驗證碼錯誤");
          req.logout();
          return res.json({ status: 0, msg: "兩步驟驗證碼錯誤" });
        }
        if (delta.delta === 0) {
          return res.json({ status: 1, u_id: req.user.u_id });
        }
      }
      if (!req.user) {
        req.logout();
        return res.json({ status: 0, msg: "帳號或密碼錯誤" });
      }
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
