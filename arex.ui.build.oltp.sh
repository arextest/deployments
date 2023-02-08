cd ../arex-front-end
npm install --save @opentelemetry/api
npm install --save @opentelemetry/instrumentation
npm install --save @opentelemetry/tracing
npm install --save @opentelemetry/exporter-trace-otlp-http
npm install --save @opentelemetry/resources
npm install --save @opentelemetry/semantic-conventions
npm install --save @opentelemetry/auto-instrumentations-node
npm install --save @opentelemetry/sdk-node

cp ../deployments/otel/tracer.js ./tracer.js
cp ../deployments/dockerfile/front.Dockerfile ./Dockerfile
docker build -t arexadmin01/arex-ui:0.2.6  .  --build-arg http_proxy=http://ntproxy.qa.nt.ctripcorp.com:8080 --build-arg https_proxy=http://ntproxy.qa.nt.ctripcorp.com:8080 
rm -rf ./Dockerfile
rm -rf ./tracer.js

cd ..
