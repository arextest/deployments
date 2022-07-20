cd ../arex-config
mvn clean package -DskipTestsa

cp ../deployments/dockerfile/config.Dockerfile ./Dockerfile
docker build -t arexadmin01/arex-config:0.1  .
rm -rf ./Dockerfile

cd ..
