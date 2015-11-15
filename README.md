## README

rails5 api test
---------------

### bref introduce
  this project is made base on rails5.

### how to use

* sign in
  > use jwt gem make a secret user authorize system
  when sigin success with user name and password, you will receive a token that used to pass request in header to authorize you role
  exmaple
  ```
  curl -X POST -H "Content-Type: application/json"  http://localhost:3000/signin -d '{"user": {"email":"xxxxxx", "password": "xxxx"}}'
  {"email":"xxxxxx","token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoibGlzaGFvaHVhMCIsImVtYWlsIjoibGlzaGFvaHVhMEBxcS5jb20ifQ.XO1BYYBvKphtOlWFBviIxEq6EKjSGV7y6Ykoozg4Qt4"}
  ```
  then in the next request you can pass header like this

  ```
  curl -X GET -H "Content-Type: application/json" -H "HTTP_AUTHORIZATION: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoibGlzaGFvaHVhMCIsImVtYWlsIjoic2Fmc2ZzZGZAcXEuY29tIn0.i_2FycDwlsnMCgQM5Awle4hu6Ug5oypM1SunjsiGrp8" http://localhost:3000/questions
  ```







