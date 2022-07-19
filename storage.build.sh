cd ../arex-storage
mvn clean package -DskipTests

cp ../arex/dockerfile/storage.Dockerfile ./Dockerfile
docker build -t   arexadmin01/arex-storage-serive:0.1 .
rm -rf ./Dockerfile

cd ..
