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
# add channel
heroku run rails channel:add[CHANNEL_ID]

# add video
heroku run rails video:fetch
```
