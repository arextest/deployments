cd ../arex-report
mvn clean package -DskipTests

cp ../deployments/dockerfile/report.Dockerfile ./Dockerfile
docker build -t arexadmin01/arex-report:0.2.7  .
rm -rf ./Dockerfile

cd ..
