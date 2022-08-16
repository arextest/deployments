cd ../arex-storage
mvn clean package -DskipTests

cp ../deployments/storage.Dockerfile ./Dockerfile
docker build -t   arexadmin01/arex-storage-serive:0.2 .
rm -rf ./Dockerfile

cd ..
