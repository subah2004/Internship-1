from dotenv import load_dotenv
load_dotenv()
import os
from supabase import create_client
from gotrue.errors import AuthApiError
url = os.environ.get("SUPABASE_URL")
key = os.environ.get("SUPABASE_KEY")
supabase = create_client(url, key)

#Create a user

credentials = {
    "email": "xyz@gmail.com",
    "password": "123456"
  }
user = None
try:

    user = supabase.auth.sign_up(credentials)
    print(user)
except AuthApiError:
    print("Login Failed")

supabase.auth.sign_out()