# Etapa de construcción
FROM maven:3.8.3-openjdk-17 AS build
WORKDIR /app

# Copiar el POM y los archivos fuente de la aplicación
COPY pom.xml .
COPY src ./src

# Compilar la aplicación y empaquetarla en un JAR ejecutable
RUN mvn clean package -DskipTests

# Etapa final: empaquetar el JAR en una imagen ligera
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copiar el JAR generado desde la etapa de construcción
COPY --from=build /app/target/orders-service-example-0.0.1-SNAPSHOT-spring-boot.jar app.jar

# Exponer el puerto en el que la aplicación se ejecutará
EXPOSE 6500

# Ejecutar la aplicación

ENTRYPOINT ["java", "-jar", "app.jar"]
CMD ["--server.port=6500", \
     "--payments.service.url=${PAYMENTS_SERVICE_URL}", \
     "--shipping.service.url=${SHIPPING_SERVICE_URL}", \
     "--products.service.url=${PRODUCTS_SERVICE_URL}"]
