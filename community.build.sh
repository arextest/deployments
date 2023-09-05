cd ../arex-community-test
mvn clean package -DskipTests

cp ../deployments/dockerfile/community.Dockerfile ./Dockerfile
cp ../arex-agent-java/arex-agent-jar/arex-agent.jar ./arex-agent.jar
cp ../arex-agent-java/arex-agent-jar/arex-agent-bootstrap.jar ./arex-agent-bootstrap.jar

docker build -t arexadmin01/arex-community-test:0.0.3  .

rm -rf ./Dockerfile
rm -rf ./arex-agent.jar
rm -rf ./arex-agent-bootstrap.jar

cd ..
