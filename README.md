# README

Initialize figaro yml file `application.yml` with
```
S3_BUCKET_NAME: ...
AWS_ACCESS_KEY_ID: YOUR_ACCESS_KEY
AWS_SECRET_ACCESS_KEY: YOUR_SECRET_KEY
AWS_REGION: ...

test:
  S3_BUCKET_NAME: ...
``` 

and then start the application after the usual `rake db:create/migrate`

Or see it in action on heroku on: https://uploader-testing-app.herokuapp.com
