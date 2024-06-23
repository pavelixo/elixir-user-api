Phoenix :
  * setup dependencies `mix setup`
  * start server `mix phx.server`

Endpoints :
 * get `/users`: users list
 * get `/users/<id>`: especify user
   
 * post `/auth/signup`: register - `{ "user": {"username": "foo", "email": "foo@bar.com", "password": "123456789" } }`
 * post `/auth/signin`: login - `{ "user": { "username": "foo", "password": "123456789" } }`
