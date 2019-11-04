Movie Trailers
========
Infinitely play movie trailer. 

https://movie-trailers.work/

## Deployment on heroku
```
# One time only
heroku create [applicatin name]
heroku config:add TZ=Asia/Tokyo
heroku config:set GOOGLE_API_KEY="[GOOGLE_API_KEY]"

git push heroku master
heroku run rails db:migrate
```

### Add trailers data
```
# fetch movies
heroku run rails movie:fetch

# fetch trailers
heroku run rails trailer:fetch
```
