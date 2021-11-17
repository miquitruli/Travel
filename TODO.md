User
- authentication
- email/password
- unique emails
- many bucketlists

bucketlist
    has_many continents
    has_many countries

    - id | country.name | continent.name | visited? (checklist)

countries
    - id | name | continent.name

bucketlist/ -> lists of all bucketlists created
    
bucketlist/new
    -create new bucketlist with countries to visit
bucketlist/1 #show

bucketlist/edit
bucketlist/delete
    - 

    /register
    /login
    /logout