#!/bin/bash

if [ -e "${WORKDIR}/package.json" ]; then    
    if [ ! -d "${WORKDIR}/node_modules" ]; then
        npm install
        npm cache clean --force
    elif [ ! -d "${WORKDIR}/.nuxt" ]; then
        npm run build
    fi

    if [ ! -z $PRODUCTION ]; then
        npm run build
        npm run start
    else
        npm run dev
    fi

    export PATH="${PATH}:${WORKDIR}/node_modules/.bin"
fi