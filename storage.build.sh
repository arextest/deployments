cd ../arex-storage
mvn clean package -DskipTests

cp ../deployments/dockerfile/storage.Dockerfile ./Dockerfile
docker build -t   arexadmin01/arex-storage-serive:latest .
rm -rf ./Dockerfile

cd ..
