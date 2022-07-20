cd ../arex-replay-schedule
mvn clean package -DskipTests

cp ../deployments/dockerfile/schedule.Dockerfile ./Dockerfile
docker build -t  arexadmin01/arex-replay-schedule:0.1  .
rm -rf ./Dockerfile

cd ..
