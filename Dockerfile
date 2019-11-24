FROM trzeci/emscripten-slim:sdk-tag-1.39.3-64bit

RUN apt-get update && apt-get install -y \
    git python3-pip python3-dev && \
    cd /usr/local/bin && \
    ln -s /usr/bin/python3 python && \
    pip3 install --upgrade pip

ENV EMSCRIPTEN_VERSION 1.39.3
ENV RENPYWEB /renpyweb

WORKDIR /

RUN git clone https://github.com/renpy/renpyweb.git
RUN (patch -p1 --forward < /renpyweb/patches/emscripten.patch || true) && echo OK

# install renpy
RUN mkdir /renpy && \
    git clone https://github.com/renpy/renpy.git "$RENPYWEB/renpy" && \
    git clone https://github.com/renpy/pygame_sdl2.git "$RENPYWEB/renpy/pygame_sdl2"

# install the web add-on
RUN "$RENPYWEB/scripts/install_in_renpy.sh"

WORKDIR /renpyweb/renpy/web
