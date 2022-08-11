cd ../arex-front-end

cp ../deployments/dockerfile/front.Dockerfile ./Dockerfile
docker build -t arexadmin01/replay-front-end:0.1  .  --build-arg http_proxy=http://ntproxy.qa.nt.ctripcorp.com:8080 --build-arg https_proxy=http://ntproxy.qa.nt.ctripcorp.com:8080 
rm -rf ./Dockerfile

cd ..