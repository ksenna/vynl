API USAGE DOCUMENT
___________________________________________________________________
Basic Authentication:
    username: hpuser
    password: hp123pass

Content Type :
   application/json

Body:
   You can pass json data in Body
   
   sample json body

    {
     "email" : "test@yopmail.com", 
     "first_name" : "arun", 
     "last_name" : "yadav"
    }

NOTE : Content Type should be set to application/json for json data in body

API Requests:

listing users
   url: http://localhost:3000/api/users
   method: GET
   body : not needed

Retrieving User detail
  url: http://localhost:3000/api/users/:id 
  method: GET
  body : not needed

creating users
   url: http://localhost:3000/api/users
   method: Post
   Body : It can be xml or json

Updating User
  url: http://localhost:3000/api/users/:id 
  method: PUT
  Body : It can be xml or json

Deleting User 
  url: http://localhost:3000/api/users/:id 
  method: DELETE
  body : not needed