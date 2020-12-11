#!/bin/bash

git submodule update --init --recursive
yarn install
rm -rf _vendor
hugo mod get -u
hugo mod vendor
THEME_PATH="_vendor/github.com/mitodl/ocw-course-hugo-theme"
PDFJS_PATH="pdfjs"
npm install --prefix $PDFJS_PATH
npm run gulp:pdfjs
yarn install --cwd $THEME_PATH
npm run build:webpack --prefix $THEME_PATH
mkdir -p static/pdfjs
cp -r pdfjs/build/generic/* static/pdfjs
cp -r $THEME_PATH/dist/* $THEME_PATH/static