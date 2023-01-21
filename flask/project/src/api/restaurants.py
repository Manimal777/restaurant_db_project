from flask import Blueprint, jsonify, abort, request
from flask_sqlalchemy import SQLAlchemy
import psycopg2

bp = Blueprint('restaurants', __name__, url_prefix='/restaurants')
db = SQLAlchemy()

conn = psycopg2.connect(
    """
    dbname=project user=postgres host=localhost port=5432
    """
)
conn.set_session(autocommit=True)
cur = conn.cursor()

@bp.route('', methods=['GET'])
def index():
    cur.execute(
        """
        SELECT id, name FROM restaurants
        ORDER BY id
        """
    )
    results = cur.fetchall()
    return jsonify(results)

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    cur.execute(
        f"""
        SELECT id, name FROM restaurants
        WHERE id={id}
        """
    )
    results = cur.fetchone()
    return jsonify(results)

@bp.route('', methods=['POST'])
def add():
    if "name" not in request.json:
        return abort(400)
    try:
        cur.execute(
            f"""
            INSERT INTO restaurants (name)
            VALUES ('{request.json["name"]}')
            """)
        return jsonify(True)
    except:
        return jsonify(False)


@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    try:
        cur.execute(
            f"""
            DELETE FROM restaurants WHERE id={id}
            """
        )
        return jsonify(True)
    except:
        return jsonify(False)

@bp.route('<int:id>', methods=['PATCH', 'PUT'])
def update(id: int):
    try:
        if "name" not in request.json:
            return abort(400)
        cur.execute(
            f"""
                UPDATE restaurants
                SET name = '{request.json["name"]}'
                WHERE id={id} 
            """
        )
    except:
        return jsonify(False)



    
    

