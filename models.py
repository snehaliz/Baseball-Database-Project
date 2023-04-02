from application import db, login_manager
from flask_login import UserMixin
from werkzeug.security import generate_password_hash, check_password_hash


#@login_manager.user_loader
#def load_user(user_id):
 #   return User.query.get(int(user_id))

class User(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key = True)
    username = db.Column(db.String(20), unique = True, nullable = False)
    password = db.Column(db.String(20), nullable = False)

    def __repr__(self):
        return "<User {}>".format(self.username)

    def set_password(self, password):
        self.password.hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password_hash, password)
