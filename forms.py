from flask_wtf import FlaskForm
from wtforms import Form, StringField, PasswordField, SubmitField, validators
from wtforms.validators import DataRequired, Length, ValidationError 
from flaskapp import User

class Login(FlaskForm):
    username = StringField("Username", validators = [DataRequired(), Length(min=8, max=20)])
    password = PasswordField("Password", validators = [DataRequired()])
    submit_form = SubmitField("Login")

class SignUpForm(FlaskForm):
    username = StringField("Username", validators = [DataRequired()])
    password = PasswordField("Password", validators = [DataRequired(), 
    validators.EqualTo('confirm', message= "Passwords must be the same.")])
    confirm = PasswordField("Re-enter your password.")
    submit_form = SubmitField("Sign Up")


    def validate_username(self, username):
        user = User.query.filter_by(username=username.data).first()
        if user:
            raise ValidationError("This username already exists. Try another username.")

