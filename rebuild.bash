#!/bin/bash

echo "Starting with eufy-security-ws project"
echo "Deleting tgz if any"
rm eufy-security-client-*.tgz
echo "Switching to the eufy-security-client project"
cd ../eufy-security-client/
echo "Deleting tgz if any"
rm eufy-security-client-*.tgz
echo "Deleting package-lock.json"
rm package-lock.json
echo "Building eufy-security-client"
npm install
npm run build
tsc
echo "Packing"
npm pack
echo "Copying to the other repo"
cp eufy-security-client-*.tgz ../eufy-security-ws/
echo "Switching to the eufy-security-ws project"
cd ../eufy-security-ws/
echo "Deleting package-lock.json"
rm package-lock.json
echo "Deleting modules eufy dep folder"
rm -r node_modules/eufy-security-client
npm install
npm run build
tsc