cd ../arex-node-service

cp ../deployments/dockerfile/node.Dockerfile ./Dockerfile
docker build -t arexadmin01/arex-node:0.2.7   .
rm -rf ./Dockerfile

cd ..