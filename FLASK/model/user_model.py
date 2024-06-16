import mysql.connector
import json
from flask import make_response
class user_model():
    def __init__(self):
        #Connection establishment code
        try:
            self.con =mysql.connector.connect(host="localhost",user="root",password ="JK123",database ="flask_db")
            self.con.autocommit=True
            self.cur = self.con.cursor(dictionary=True)
            print("Connection successfully established")
        except:
            print("Error")
    def user_getall_model(self):
        self.cur.execute("SELECT * FROM user")
        result = self.cur.fetchall()
        if(len(result)>0):
            return make_response({"payload: ":result},200)
        else:
            return make_response({"message":"No data found"},201)
    def user_addone_model(self,data):
        self.cur.execute(f"INSERT INTO user(id,name, email, phone, role, password) VALUES('{data['id']}','{data['name']}', '{data['email']}', '{data['phone']}', '{data['role']}', '{data['password']}')")

        return make_response({"message":"User created successfully"},200)
    
    def user_update_model(self,data):
        self.cur.execute(f"UPDATE user SET name = '{data['name']}', email='{data['email']}', phone='{data['phone']}', role='{data['role']}', password='{data['password']}' WHERE id = {data['id']}")
        if self.cur.rowcount >0:
            return make_response({"message":"User updated successfully"},201)
        else:
            return make_response({"message":"Nothing has been updated."},202)
    def user_delete_model(self,id):
        self.cur.execute(f"DELETE from user WHERE id={id}")
        if self.cur.rowcount >0:
            return make_response({"message":"User deleted successfully"},200)
        else:
            return make_response({"message":"Nothing has been deleted."},201)
    