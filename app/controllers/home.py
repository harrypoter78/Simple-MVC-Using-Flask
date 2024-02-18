from flask import render_template, request, jsonify, Blueprint, session, redirect, url_for, make_response
from flask.views import MethodView
from datetime import datetime
import csv
from app import db
from app.models.kelasA import KelasA, ASchema
from app.models.kelasB import KelasB, BSchema
from app.models.user import User, UserSchema
from flask_jwt_extended import jwt_required, unset_jwt_cookies, get_jwt_identity

home = Blueprint('home', __name__)

@home.route('/')
@jwt_required()
def index():
    name = get_jwt_identity()
    return render_template('home.html',name=name)

@home.route('/logout')
# @jwt_required()
def logout():
    resp = make_response(redirect(url_for('login.index')))
    unset_jwt_cookies(resp)
    return resp

class HomeController(MethodView):
    def post(self):
        json_data = request.get_json()
        fnama = json_data['fnama']
        fumur = json_data['fumur']
        fnilai = json_data['fnilai']
        flulus = json_data['flulus']
        fchoosedb = json_data['fchoosedb']

        if fchoosedb == "classA":
            postdb = KelasA(nama=fnama, umur=fumur, nilai=fnilai, lulus=flulus)
        else:
            postdb = KelasB(nama=fnama, umur=fumur, nilai=fnilai, lulus=flulus)

        db.session.add(postdb)
        db.session.commit()
        self.saveNewData(fchoosedb, fnama, fumur, fnilai, flulus)
        return jsonify(fnama, fumur, fnilai, flulus)

    def get(self):
        dbA = KelasA.query.all()
        dbB = KelasB.query.all()
        schA = ASchema(many=True)
        schB = BSchema(many=True)
        outA = schA.dump(dbA)
        outB = schB.dump(dbB)
        self.saveAll()
        return jsonify({'Kelas A': outA, 'Kelas B': outB})

    def saveNewData(self, textdb, fnama, fumur, fnilai, flulus):
        last_modified = datetime.now()
        header = ['kelas', 'nama', 'umur', 'nilai', 'lulus', 'last_modified']
        data = [textdb, fnama, fumur, fnilai, flulus, last_modified]

        with open('exportNewData.csv', 'w', encoding='UTF8', newline='') as f:
            writer = csv.writer(f)
            writer.writerow(header)
            writer.writerow(data)

    def saveAll(self):
        header = ['id_student', 'nama', 'umur', 'nilai', 'lulus', 'last_modified']
        dataA = KelasA.query.with_entities(KelasA.id_student, KelasA.nama, KelasA.umur, KelasA.nilai, KelasA.lulus, KelasA.last_modified)
        dataB = KelasB.query.with_entities(KelasB.id_student, KelasB.nama, KelasB.umur, KelasB.nilai, KelasB.lulus, KelasB.last_modified)

        with open('exportAllDatabase.csv', 'w', encoding='UTF8', newline='') as f:
            writer = csv.writer(f)
            writer.writerow(header)
            for i in dataA:
                writer.writerow(i)
            for i in dataB:
                writer.writerow(i)


home_view = HomeController.as_view('home_view')
home.add_url_rule('/post', view_func=home_view, methods=['POST'])
home.add_url_rule('/get', view_func=home_view, methods=['GET'])