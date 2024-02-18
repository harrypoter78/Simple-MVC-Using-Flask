from datetime import datetime
from app import db, ma

class KelasA(db.Model):
    __tablename__ = "class_a"

    id_student = db.Column(db.Integer, primary_key=True)
    nama = db.Column(db.VARCHAR(50))
    umur = db.Column(db.Integer)
    nilai = db.Column(db.Float)
    lulus = db.Column(db.Boolean)
    last_modified = db.Column(db.DateTime, default=datetime.now)

    def __repr__(self):
        return '<Kelas A {}>'.format(self.nama)

class ASchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = KelasA
        load_instance = True