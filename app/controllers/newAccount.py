from flask import render_template, request, jsonify, Blueprint
from flask.views import MethodView
from app import db
from app.models.user import User

newAccount = Blueprint('newAccount', __name__)

@newAccount.route('/')
def index():
    return render_template('newAccount.html')

class newAccountController(MethodView):
    def post(self):
        json_data = request.get_json()
        fuser = json_data['fuser']
        fpass = json_data['fpass']
        femail = json_data['femail']

        hashPass = User().setPassword(fpass)
        postdb = User(username=fuser, password=hashPass, email=femail)

        db.session.add(postdb)
        db.session.commit()

        return jsonify(fuser, hashPass, femail)


newAccount_view = newAccountController.as_view('newAccount_view')
newAccount.add_url_rule('/post', view_func=newAccount_view, methods=['POST'])