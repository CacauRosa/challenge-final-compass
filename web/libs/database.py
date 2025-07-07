from robot.api.deco import keyword
from pymongo import MongoClient
from bson.objectid import ObjectId

client = MongoClient('<sua URI de conexão MongoDB>')

db = client['cinemadb']

@keyword("Remove cinema do banco de dados")
def remove_theater(id):
    theaters = db['theaters']
    obj_id = ObjectId(id)
    theaters.delete_many({'_id': obj_id})
    print(f"Removendo cinema com id {id} do banco de dados")

@keyword("Remove filme do banco de dados")
def remove_movie(id):
    movies = db['movies']
    obj_id = ObjectId(id)
    movies.delete_many({'_id': obj_id})
    print(f"Removendo filme com id {id} do banco de dados")

@keyword("Remove sessao do banco de dados")
def remove_session(id):
    sessions = db['sessions']
    obj_id = ObjectId(id)
    sessions.delete_many({'_id': obj_id})
    print(f"Removendo sessão com id {id} do banco de dados")