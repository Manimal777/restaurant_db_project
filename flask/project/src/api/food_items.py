from flask import Blueprint, jsonify, abort, request
from flask_sqlalchemy import SQLAlchemy
import psycopg2

bp = Blueprint('food_items', __name__, url_prefix='/food_items')
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
        SELECT id, name, type, price FROM food_items
        ORDER BY id
        """
    )
    results = cur.fetchall()
    return jsonify(results)

@bp.route('<int:id>', methods=['GET'])
def show(id: int):
    cur.execute(
        f"""
        SELECT id, name, type, price FROM food_items
        WHERE id={id}
        """
    )
    return jsonify(cur.fetchone())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    cur.execute(
        f"""
        DELETE FROM food_items WHERE id={id}
        """
    )
    results=cur.fetchone()
    return jsonify(results)