#!/bin/bash

git submodule update --init --recursive
yarn install
hugo mod get -u
hugo mod vendor
THEME_PATH="_vendor/github.com/mitodl/ocw-course-hugo-theme"
PDFJS_PATH="pdfjs"
npm install --prefix $PDFJS_PATH
npm run gulp:pdfjs
yarn install --cwd $THEME_PATH
npm run build:webpack --prefix $THEME_PATH