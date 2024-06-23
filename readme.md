Phoenix :
  * setup dependencies `mix setup`
  * start server `mix phx.server`

Endpoints :
 * get `/users`: users list
 * get `/users/<id>`: especify user
   
 * post `/auth/signup`: register <br>
`{ "user": {"username": "foo", "email": "foo@bar.com", "password": "123456789" } }`
 * post `/auth/signin`: login <br>
`{ "user": { "username": "foo", "password": "123456789" } }`
