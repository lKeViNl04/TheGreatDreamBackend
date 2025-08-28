# 🌙 El Gran Sueño – Backend

> ⚡ Este repositorio está enlazado al frontend: **[TheGreatDreamFrontend](https://github.com/lKeViNl04/TheGreatDreamFrontend)**

---

## 🏷️ Insignias

![Java](https://img.shields.io/badge/Java-21+-red?logo=openjdk)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.5.4-green?logo=springboot)
![MySQL](https://img.shields.io/badge/Database-MySQL-blue?logo=mysql)
![Maven](https://img.shields.io/badge/Build-Maven-orange?logo=apachemaven)

---

## 📖 Contexto

Backend de **The Great Dream**, un sistema para la gestión de datos y operaciones de una comunidad cerrada.
Expone una API REST conectada a una base de datos MySQL y se integra con el frontend.

---

## 🛠️ Tecnologías

- Java 21+
- Spring Boot 3.5.4 (Web, Datos JPA, Validación, Seguridad, Actuador)
- MySQL
- Maven
- Lombok y MapStruct

---

## ✅ Prerrequisitos

- Java 21+ instalado
- Maven instalado
- MySQL en ejecución

---

## ⚙️ Ejecutar el proyecto

1. Clonar el repositorio
```bash
git clone https://github.com/lKeViNl04/TheGreatDreamBackend.git
cd TheGreatDreamBackend
```
2. Configurar src/main/resources/application.properties con las credenciales de la base de datos:
```bash
spring.datasource.url=jdbc:mysql://localhost:3306/thegreatdream
spring.datasource.username=TU_NOMBRE_DE_USUARIO
spring.datasource.password=TU_CONTRASEÑA
spring.jpa.hibernate.ddl-auto=update
```
3. Iniciar el proyecto
```bash
mvn spring-boot:run
```

---

## 📂 Estructura
```bash
src/
├── main/java/com/gatedcommunity # Controladores, Servicios, Modelos, Repositorios
└── main/resources # Archivos de configuración
pom.xml # Dependencias y configuración del proyecto
```

---

## 🚀 Próximos pasos

Funciones y mejoras planificadas:

- Implementar CRUD para roles y usuarios
- Añadir autenticación y autorización (JWT + Spring Security)
- Añadir pruebas unitarias y de integración
- Añadir compatibilidad con Docker para una implementación más sencilla
- Implementar en la nube (Heroku, AWS o similar)
