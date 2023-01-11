docker run  -v "$PWD":/usr/src/arex --rm -p 8088:8080 --name arex-docker-demo   -w /usr/src/arex openjdk:11  java -javaagent:/usr/src/arex/arex-agent-0.1.0.jar -Darex.config.path=/usr/src/arex/arex.agent.conf -jar /usr/src/arex/spring-petclinic-2.6.0-SNAPSHOT.jar -m org.springframework.samples.petclinic.PetClinicApplication &

