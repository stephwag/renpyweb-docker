set -e

RENPYWEB="/renpyweb"
cd $RENPYWEB

if [ -e "$RENPYWEB/renpy/web" ] ; then
    rm -Rf "$RENPYWEB/renpy/web"
fi

mkdir "$RENPYWEB/renpy/web"

for i in asmjs.js asmjs.html.mem asmjs.html asmjs.em index.em index.html index.js index.wasm.gz pyapp.data pyapp-data.js pythonhome.data pythonhome-data.js zee.js; do
    if [ -e "$RENPYWEB/build/t/$i" ]; then
        cp "$RENPYWEB/build/t/$i" "$RENPYWEB/renpy/web/$i"
    fi
done
