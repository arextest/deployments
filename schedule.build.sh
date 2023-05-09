printf "current AREX Version: $AREX_VERSION
Run shell: export AREX_VERSION=0.2.9 (set arex version)
or unset AREX_VERSION (unset arex version)
"

cd ../arex-replay-schedule
mvn clean package -DskipTests

cp ../deployments/dockerfile/schedule.Dockerfile ./Dockerfile
docker build -t  arexadmin01/arex-replay-schedule:$AREX_VERSION  .
rm -rf ./Dockerfile

cd ..
