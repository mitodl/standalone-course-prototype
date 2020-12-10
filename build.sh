#!/bin/bash

git submodule update --init --recursive --remote
cd themes/ocw-course-hugo-theme
yarn install
npm run build