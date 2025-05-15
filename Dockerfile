# استخدم JDK 21 لأن مشروعك يستخدم Java 21
FROM openjdk:21-jdk-slim

# حدد مجلد العمل داخل الحاوية
WORKDIR /app

# انسخ الملف الناتج من البناء
COPY target/*.jar app.jar

# شغّل التطبيق
ENTRYPOINT ["java", "-jar", "app.jar"]
