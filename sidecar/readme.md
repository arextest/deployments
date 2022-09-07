## Sidecar Config

### AREX Sidecar
```
https://hub.docker.com/repository/docker/arexadmin01/arex-agent-sidecar
```

### arex sidecar docker file
```yaml
FROM busybox
ENV LANG=C.UTF-8
RUN set -eux && mkdir -p /usr/arex/agent
ADD ./arex-agent-*.jar /usr/arex/agent/
WORKDIR /
```

### Sidecar config demo: deployment.yaml
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sidecar-monitor-demo
spec:
  selector:
    matchLabels:
      app: sidecar-monitor-demo
  replicas: 1
  minReadySeconds: 5
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
  template:
    metadata:
      labels:
        app: sidecar-monitor-demo
    spec:
      containers:
        - image: nginx:latest
          name: nginx
          imagePullPolicy: Always
          resources:
            limits:
              memory: 1Gi
              cpu: "1"
          ports:
            - containerPort: 80
              protocol: TCP
          env:
            - name: JAVA_TOOL_OPTIONS
              value: -javaagent:/usr/arex/agent/arex-agent-0.1.0.jar -Darex.service.name=your-service-name -Darex.storage.service.host=10.0.0.1:8093 -Darex.config.service.host=10.0.0.1:8091
          volumeMounts:
            - name: arex-agent
              mountPath: /usr/arex/agent
      initContainers:
        - image: arexadmin01/arex-agent-sidecar:latest
          name: arex-agent-sidecar
          imagePullPolicy: IfNotPresent
          command: ["sh"]
          args:
            [
              "-c",
              "mkdir -p /arex/agent && cp -r /usr/arex/agent/* /arex/agent",
            ]
          volumeMounts:
            - name: arex-agent
              mountPath: /arex/agent
      volumes:
        - name: arex-agent
          emptyDir: {}
```