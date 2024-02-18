from datetime import datetime
from app import db, ma

class KelasB(db.Model):
    __tablename__ = "class_b"

    id_student = db.Column(db.Integer, primary_key=True)
    nama = db.Column(db.VARCHAR(50))
    umur = db.Column(db.Integer)
    nilai = db.Column(db.Float)
    lulus = db.Column(db.Boolean)
    last_modified = db.Column(db.DateTime, default=datetime.now)

    def __repr__(self):
        return '<Kelas B {}>'.format(self.nama)

class BSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = KelasB
        load_instance = True