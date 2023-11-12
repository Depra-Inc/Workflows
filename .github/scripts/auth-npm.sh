#!/bin/bash

echo "//${NPM_DOMAIN}/:_authToken=${NPM_AUTH_TOKEN}
registry=${NPM_REGISTRY}" >> .npmrc
cat .npmrc