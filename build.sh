#!/bin/bash

git submodule update --init --recursive
yarn install
hugo mod get -u
hugo mod vendor
VENDOR_PATH="_vendor/github.com/mitodl/ocw-course-hugo-theme"
PDFJS_PATH="pdfjs"
npm install --prefix $PDFJS_PATH
npm run gulp:pdfjs
yarn install --cwd $VENDOR_PATH
npm run build:webpack --prefix $VENDOR_PATH