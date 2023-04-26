cd ../dubbo_commuity_test
mvn clean package -DskipTests


cp ../arex-agent-java/arex-agent-jar/arex-agent-0.2.0.jar ./arex-agent-0.2.0.jar
cp ../arex-agent-java/arex-agent-jar/arex-agent-bootstrap-0.2.0.jar ./arex-agent-bootstrap-0.2.0.jar
#cp ../deployments/agent/arex-agent-0.1.0.jar ./arex-agent-0.1.0.jar
#cp ../deployments/agent/arex-agent-bootstrap-0.1.0.jar ./arex-agent-bootstrap-0.1.0.jar

cp ../deployments/dockerfile/dubbo2.community.Dockerfile ./Dockerfile
docker build -t arexadmin01/dubbo2-community-test:0.0.1  .
rm -rf ./Dockerfile

cp ../deployments/dockerfile/dubbo3.community.Dockerfile ./Dockerfile
docker build -t arexadmin01/dubbo3-community-test:0.0.1  .
rm -rf ./Dockerfile

rm -rf ./arex-agent-0.2.0.jar
rm -rf ./arex-agent-bootstrap-0.2.0.jar

cd ..