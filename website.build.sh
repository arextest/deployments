cd ../website

cp ../deployments/dockerfile/website.Dockerfile ./Dockerfile
docker build -t arexadmin01/website:0.0.1  .  --build-arg http_proxy=http://ntproxy.qa.nt.ctripcorp.com:8080 --build-arg https_proxy=http://ntproxy.qa.nt.ctripcorp.com:8080 
rm -rf ./Dockerfile

cd ..
