Phoenix :
  * setup dependencies `mix setup`
  * start server `mix phx.server`

Endpoints :
 * **GET** `/users`: Retrieve all users
 * **GET** `/users/<id>`: Retrieve a specific user
   
 * **POST** `/auth/signup`: Register a new user <br>
   Example request body:
   ```
   {
    "user": {
     "username": "foo",
     "email": "foo@bar.com",
     "password": "123456789"
    }
   }
   ```
   
 * **POST** `/auth/signin`: User login <br>
   Example request body:
   ```
   {
    "user": {
     "username": "foo",
     "password": "123456789"
    }
   }
   ```
