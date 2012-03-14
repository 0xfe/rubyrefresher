#!/bin/bash

DEST=~/x/www/rubyrefresher

./markdown.pl refresher.md >$DEST/index.html
cp refresher.css $DEST/refresher.css
