# استخدم صورة Java مع Maven
FROM maven:3.9.6-eclipse-temurin-21 AS build

# انسخ ملفات المشروع
COPY . /app
WORKDIR /app

# ابني المشروع
RUN mvn clean package -DskipTests

# المرحلة الثانية: صورة تشغيل خفيفة
FROM eclipse-temurin:21-jdk-alpine
VOLUME /tmp

# انسخ الـ JAR من المرحلة الأولى
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]
