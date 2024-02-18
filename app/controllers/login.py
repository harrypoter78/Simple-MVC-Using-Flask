from flask import render_template, request, Blueprint, jsonify, make_response, redirect, url_for
from flask.views import MethodView
from app.models.user import User
from app import assign_access_refresh_tokens
from flask_jwt_extended import *

login = Blueprint('login', __name__)

@login.route('/')
def index():
    return render_template('login.html')


class loginController(MethodView):
    def post(self):
        # json_data = request.get_json()
        # fuser = json_data['fuser']
        # fpass = json_data['fpass']

        fuser = request.form['fuser']
        fpass = request.form['fpass']

        user = User.query.filter_by(username=fuser).first()

        if not user or not user.checkPassword(fpass):
            error = 'Invalid Username/Password'
            return render_template('login.html', error=error)

        return assign_access_refresh_tokens(user.username, 'home.index')


login_view = loginController.as_view('login_view')
login.add_url_rule('/post', view_func=login_view, methods=['POST'])