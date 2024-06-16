
from dotenv import load_dotenv
load_dotenv()
import os
from supabase import create_client

#Url
url = os.environ.get("SUPABASE_URL")
key = os.environ.get("SUPABASE_KEY")
supabase = create_client(url, key)

#Inserting data

data = supabase.table('main_table').insert({"id": 2, "name": "Tom"}).execute()
print(data)

#Fetching the data
response = supabase.table('main_table').select("*").execute()
print(response)

#Updating the data
data = supabase.table('main_table').update({'name': 'Raze'}).eq('id', 1).execute()
response1 = supabase.table('main_table').select("*").execute()
print(response1)

#Deleting the data
data2 = supabase.table('main_table').delete().eq('id',1).execute()
response3 = supabase.table('main_table').select("*").execute()
print(response3)