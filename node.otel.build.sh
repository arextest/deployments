cd ../arex-node-service

cp ../deployments/otel/tracer.js ./tracer.js
cp ../deployments/dockerfile/node.Dockerfile ./Dockerfile

docker build -t arexadmin01/arex-node:0.2.6   .

rm -rf ./Dockerfile
rm -rf ./tracer.js

cd ..