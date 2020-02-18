from wsgiref.simple_server import make_server
from pyramid.config import Configurator
from pyramid.response import Response

import json
import mysql.connector as mysql
import os

db_user = os.environ['MYSQL_USER']
db_pass = os.environ['MYSQL_PASSWORD']
db_name = os.environ['MYSQL_DATABASE']
db_host = os.environ['MYSQL_HOST']

#console.log(first_name) in cursor
###defining functions that get from data base
def get_user_count(req):
  db = mysql.connect(host=db_host, database=db_name, user=db_user, passwd=db_pass)
  cursor = db.cursor()
  cursor.execute("SELECT count(id) from Users;")
  records = cursor.fetchall()
  return json.dumps(records)

def get_user_age(req):
  db = mysql.connect(host=db_host, database=db_name, user=db_user, passwd=db_pass)
  cursor = db.cursor()
  cursor.execute("SELECT avg(age) from Users;")
  records = cursor.fetchall()
  return json.dumps(records)

def count_user_course(req):
  db = mysql.connect(host=db_host, database=db_name, user=db_user, passwd=db_pass)
  cursor = db.cursor()
  cursor.execute("SELECT Users.firstname, Users.lastname, Enrollments.course_id FROM Users INNER JOIN Enrollments ON Users.id=Enrollments.student_id AND course_id=2;")
  records = cursor.fetchall()
  return json.dumps(records)

def count_user_course(req):
  db = mysql.connect(host=db_host, database=db_name, user=db_user, passwd=db_pass)
  cursor = db.cursor()
  cursor.execute("SELECT Users.firstname, Users.lastname, Enrollments.course_id FROM Users INNER JOIN Enrollments ON Users.id=Enrollments.student_id AND course_id=2;")
  records = cursor.fetchall()
  return json.dumps(records)

  if record is None:
    return ""


''' Route Configurations '''
if __name__ == '__main__':
  config = Configurator()

  config.add_route('get_user_count', '/get_user_count')
  config.add_view(get_user_count, route_name='get_user_count', renderer='json')

  config.add_route('get_user_age', '/get_user_age')
  config.add_view(get_user_age, route_name='get_user_age', renderer='json')

  config.add_route('count_user_course', '/count_user_course')
  config.add_view(count_user_course, route_name='count_user_course', renderer='json')

  app = config.make_wsgi_app()
  server = make_server('0.0.0.0', 6000, app)
  server.serve_forever()
