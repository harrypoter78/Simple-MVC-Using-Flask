from flask import Flask, make_response, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
from flask_migrate import Migrate
from flask_jwt_extended import *
from datetime import timedelta

app = Flask(__name__)
SQLALCHEMY_DATABASE_URI = "mysql+mysqlconnector://{username}:{password}@{hostname}/{databasename}".format(
    username="root",
    password="",
    hostname="localhost",
    databasename="assignment_project",)

app.config["SQLALCHEMY_DATABASE_URI"] = SQLALCHEMY_DATABASE_URI
app.config["SQLALCHEMY_POOL_RECYCLE"] = 299
app.config['SECRET_KEY'] = 'super secret key'
SQLALCHEMY_TRACK_MODIFICATIONS = False
db = SQLAlchemy(app)
ma = Marshmallow(app)
migrate = Migrate(app, db)
app.config['JWT_SECRET_KEY'] = 'super-secret'
app.config['JWT_TOKEN_LOCATION'] = ['cookies']
app.config['JWT_ACCESS_TOKEN_EXPIRES'] = timedelta(minutes = 1)
app.config['JWT_COOKIE_CSRF_PROTECT'] = True
app.config['JWT_CSRF_CHECK_FORM'] = True
jwt = JWTManager(app)

def assign_access_refresh_tokens(user_id, url):
    access_token = create_access_token(identity=str(user_id), fresh = True)
    refresh_token = create_refresh_token(identity=str(user_id))
    resp = make_response(redirect(url_for(url)))
    set_access_cookies(resp, access_token)
    set_refresh_cookies(resp, refresh_token)
    return resp

@jwt.unauthorized_loader
def unauthorized_callback(callback):
    # No auth header
    return redirect(url_for('newAccount.index'))

@jwt.invalid_token_loader
def invalid_token_callback(callback):
    # Invalid Fresh/Non-Fresh Access token in auth header
    resp = make_response(redirect(url_for('newAccount.index')))
    unset_jwt_cookies(resp)
    return resp, 302

# @jwt.expired_token_loader
# def expired_token_callback(callback):
#     # Expired auth header
#     resp = make_response(redirect(url_for('refresh')))
#     unset_access_cookies(resp)
#     return resp, 302

from app.controllers import *
from app.controllers.home import home
from app.controllers.login import login
from app.controllers.newAccount import newAccount

app.register_blueprint(home, url_prefix="/home")
app.register_blueprint(login, url_prefix="")
app.register_blueprint(newAccount, url_prefix="/newAccount")