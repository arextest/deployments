cd ../dubbo_commuity_test
mvn clean package -DskipTests

cp ../arex-agent-java/arex-agent-jar/arex-agent-0.3.0.jar ./arex-agent-0.3.0.jar
cp ../arex-agent-java/arex-agent-jar/arex-agent-bootstrap-0.3.0.jar ./arex-agent-bootstrap-0.3.0.jar
#cp ../deployments/agent/arex-agent-0.3.0.jar ./arex-agent-0.3.0.jar
#cp ../deployments/agent/arex-agent-bootstrap-0.3.0.jar ./arex-agent-bootstrap-0.3.0.jar
cp ../arex-agent-java/arex-agent-jar/arex-agent-0.3.0.1.jar ./arex-agent-0.3.0.1.jar
cp ../arex-agent-java/arex-agent-jar/arex-agent-bootstrap-0.3.0.1.jar ./arex-agent-bootstrap-0.3.0.1.jar

cp ../deployments/dockerfile/dubbo2.community.Dockerfile ./Dockerfile
docker build -t arexadmin01/dubbo2-community-test:0.0.1  .
rm -rf ./Dockerfile

cp ../deployments/dockerfile/dubbo3.community.Dockerfile ./Dockerfile
docker build -t arexadmin01/dubbo3-community-test:0.0.1  .
rm -rf ./Dockerfile

rm -rf ./arex-agent-0.3.0.jar
rm -rf ./arex-agent-bootstrap-0.3.0.jar
rm -rf ./arex-agent-0.3.0.1.jar
rm -rf ./arex-agent-bootstrap-0.3.0.1.jar

#cp ../deployments/arex-agent-jar/arex-agent-0.3.0.jar ./arex-agent-0.3.0.jar
#cp ../deployments/arex-agent-jar/arex-agent-bootstrap-0.3.0.jar ./arex-agent-bootstrap-0.3.0.jar

#cp ../deployments/dockerfile/dubbo2.custom.community.Dockerfile ./Dockerfile
#docker build -t arexadmin01/dubbo2-custom-community-test:0.0.1 .
#rm -rf ./Dockerfile
cp ../deployments/arex-agent-jar/arex-agent-0.3.4.jar ./arex-agent-0.3.4.jar
cp ../deployments/arex-agent-jar/arex-agent-bootstrap-0.3.4.jar ./arex-agent-bootstrap-0.3.4.jar

cp ../deployments/dockerfile/dubbox.custom.community.Dockerfile ./Dockerfile
docker build -t arexadmin01/dubbox-custom-community-test:0.0.1 .

rm -rf ./arex-agent-0.3.4.jar
rm -rf ./arex-agent-bootstrap-0.3.4.jar

cd ..
