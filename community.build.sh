cd ../arex-community-test
mvn clean package -DskipTests

cp ../deployments/dockerfile/community.Dockerfile ./Dockerfile
cp ../arex-agent-java/arex-agent-jar/arex-agent-0.2.0.jar ./arex-agent-0.2.0.jar
cp ../arex-agent-java/arex-agent-jar/arex-agent-bootstrap-0.2.0.jar ./arex-agent-bootstrap-0.2.0.jar
#cp ../deployments/agent/arex-agent-0.2.0.jar ./arex-agent-0.2.0.jar
#cp ../deployments/agent/arex-agent-bootstrap-0.2.0.jar ./arex-agent-bootstrap-0.2.0.jar

docker build -t arexadmin01/arex-community-test:0.0.1  .

rm -rf ./Dockerfile
rm -rf ./arex-agent-0.2.0.jar
rm -rf ./arex-agent-bootstrap-0.2.0.jar

cd ..
