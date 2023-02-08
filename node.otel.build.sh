cd ../arex-node-service
npm install --save @opentelemetry/api
npm install --save @opentelemetry/instrumentation
npm install --save @opentelemetry/tracing
npm install --save @opentelemetry/exporter-trace-otlp-http
npm install --save @opentelemetry/resources
npm install --save @opentelemetry/semantic-conventions
npm install --save @opentelemetry/auto-instrumentations-node
npm install --save @opentelemetry/sdk-node

cp ../deployments/otel/tracer.js ./tracer.js
cp ../deployments/dockerfile/node.Dockerfile ./Dockerfile
docker build -t arexadmin01/arex-node:0.2.6   .

rm -rf ./Dockerfile
rm -rf ./tracer.js

cd ..