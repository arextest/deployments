cd ../arex-community-test
mvn clean package -DskipTests

cp ../deployments/dockerfile/community.Dockerfile ./Dockerfile
cp ../deployments/agent/arex-agent-0.*.jar ./arex-agent.jar
cp ../deployments/agent/arex-agent-bootstrap-*.jar ./arex-agent-bootstrap.jar

docker build -t arexadmin01/arex-community-test:0.0.1  .

rm -rf ./Dockerfile
rm -rf ./arex-agent.jar
rm -rf ./arex-agent-bootstrap.jar

cd ..
