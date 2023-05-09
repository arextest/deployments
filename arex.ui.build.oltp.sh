printf "current AREX Version: $AREX_VERSION
Run shell: export AREX_VERSION=0.2.9 (set arex version)
or unset AREX_VERSION (unset arex version)
"
cd ../arex-front-end

cp ../deployments/otel/tracer.js ./tracer.js
cp ../deployments/dockerfile/arex.ui.otel.Dockerfile ./Dockerfile
docker build -t arexadmin01/arex-ui:$AREX_VERSION  .  --build-arg http_proxy=http://ntproxy.qa.nt.ctripcorp.com:8080 --build-arg https_proxy=http://ntproxy.qa.nt.ctripcorp.com:8080 
rm -rf ./Dockerfile
rm -rf ./tracer.js

cd ..
