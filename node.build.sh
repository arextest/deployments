cd ../arex-node-service

cp ../deployments/dockerfile/node.Dockerfile ./Dockerfile
docker build -t arex-node  .
rm -rf ./Dockerfile

cd ..