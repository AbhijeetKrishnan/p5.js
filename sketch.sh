#!/bin/sh

SKETCH=${1};

cat > scripts/sketches/${SKETCH}.js <<- EOM
function setup() {
  // setup goes here
}

function draw() {
  // draw something here
}
EOM

cat > html/${SKETCH}.html <<- EOM
<!DOCTYPE html>
<html lang="en">
  <head>
    <script src="../scripts/p5/p5.min.js"></script>
    <script src="../scripts/p5/p5.sound.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <meta charset="utf-8" />

  </head>
  <body>
    <main>
    </main>
    <script src="../scripts/sketches/${SKETCH}.js"></script>
  </body>
</html>

EOM

# Update index.html
sed -i -z -e "s/\(.*\)<\/li>/\1<\/li>\n\ \ \ \ \ \ <li><a href=\"html\/${SKETCH}.html\">${SKETCH}<\/a><\/li>/" index.html