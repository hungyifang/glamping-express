const LocalStrategy = require("passport-local");
const usersModel = require("../models/users.js");

module.exports = function (passport) {
  passport.serializeUser((user, done) => {
    console.log("Inside serialize User callback");
    done(null, user.u_id);
  });

  passport.deserializeUser((id, done) => {
    console.log("Inside deserializeUser callback");
    usersModel
      .findById(id)
      .then((user) => {
        if (!user) {
          return done(null, false, {
            errors: { "username or password": "is invalid" },
          });
        }

        return done(null, user);
      })
      .catch(done);
  });

  passport.use(
    new LocalStrategy(
      {
        usernameField: "username",
        passwordField: "password",
      },
      (username, password, done) => {
        usersModel
          .findOneForLogin({ username, password })
          .then((user) => {
            if (!user.u_id) {
              return done(null, false, {
                errors: { "email or password": "is invalid" },
              });
            }

            return done(null, user);
          })
          .catch(done);
      }
    )
  );
};
