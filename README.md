Runs [renpyweb](https://github.com/renpy/renpyweb) from Docker.

To use, just run this command
```
docker run -p 8000:8000 \
-v /path/to/your/game:/renpyweb/renpy/web/ \
stephwag/renpyweb python3 -m http.server 8000
```
