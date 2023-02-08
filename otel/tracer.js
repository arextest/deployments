"use strict";

const {
  BasicTracerProvider,
  ConsoleSpanExporter,
  SimpleSpanProcessor,
} = require("@opentelemetry/tracing");
const {
  OTLPTraceExporter,
} = require("@opentelemetry/exporter-trace-otlp-http");
const { Resource } = require("@opentelemetry/resources");
const {
  SemanticResourceAttributes,
} = require("@opentelemetry/semantic-conventions");

const opentelemetry = require("@opentelemetry/sdk-node");
const {
  getNodeAutoInstrumentations,
} = require("@opentelemetry/auto-instrumentations-node");

const hostName = process.env.OTEL_TRACE_HOST || "localhost";
const otlpPort = process.env.OTEL_TRACE_PORT || 4318;
const serviceName = process.env.OTEL_TRACE_SERVICE || "UNKOWN";

const exporter = new OTLPTraceExporter({
  url: "http://${hostName}:${otlpPort}/v1/traces",
});

const provider = new BasicTracerProvider({
  resource: new Resource({
    [SemanticResourceAttributes.SERVICE_NAME]: "${serviceName}",
  }),
});
// export spans to console (useful for debugging)
provider.addSpanProcessor(new SimpleSpanProcessor(new ConsoleSpanExporter()));
// export spans to opentelemetry collector
provider.addSpanProcessor(new SimpleSpanProcessor(exporter));

provider.register();
const sdk = new opentelemetry.NodeSDK({
  traceExporter: exporter,
  instrumentations: [getNodeAutoInstrumentations()],
});

sdk
  .start()
  .then(() => {
    console.log("Tracing initialized");
  })
  .catch((error) => console.log("Error initializing tracing", error));

process.on("SIGTERM", () => {
  sdk
    .shutdown()
    .then(() => console.log("Tracing terminated"))
    .catch((error) => console.log("Error terminating tracing", error))
    .finally(() => process.exit(0));
});
