# 🌙 The Great Dream – Backend

> ⚡ This repository is linked to the frontend: **[TheGreatDreamFrontend](https://github.com/lKeViNl04/TheGreatDreamFrontend)**

---

## 🏷️ Badges

![Java](https://img.shields.io/badge/Java-21+-red?logo=openjdk)   ![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.5.4-green?logo=springboot) ![MySQL](https://img.shields.io/badge/Database-MySQL-blue?logo=mysql)  ![Maven](https://img.shields.io/badge/Build-Maven-orange?logo=apachemaven)  

---

## 📖 Context

Backend of **The Great Dream**, a system to manage data and operations for a gated community.  
It exposes a REST API connected to a MySQL database and integrates with the frontend.

---

## 🛠️ Technologies

- Java 21+  
- Spring Boot 3.5.4 (Web, Data JPA, Validation, Security, Actuator)  
- MySQL  
- Maven  
- Lombok & MapStruct  

---

## ✅ Prerequisites

- Java 21+ installed  
- Maven installed  
- MySQL running  

---

## ⚙️ Run the Project

1. Clone the repo
   ```bash
   git clone https://github.com/lKeViNl04/TheGreatDreamBackend.git
   cd TheGreatDreamBackend
   ```
2. Configure src/main/resources/application.properties with your DB credentials:
  ```bash
    spring.datasource.url=jdbc:mysql://localhost:3306/thegreatdream
    spring.datasource.username=YOUR_USERNAME
    spring.datasource.password=YOUR_PASSWORD
    spring.jpa.hibernate.ddl-auto=update
  ```
3. Start the project
  ```bash
    mvn spring-boot:run
  ```

---

## 📂 Structure
  ```bash
    src/
    ├── main/java/com/gatedcommunity   # Controllers, Services, Models, Repositories
    └── main/resources                 # Config files
    pom.xml                             # Dependencies & project config
  ```

---

---

## 🆕 Recent Updates

Latest improvements in the backend:

- Refactored project structure for better modularity:
  - Introduced packages: `mapper`, `repository`, `service`, `util`.
- Added `database` folder with SQL scripts:
  - `gatedcommunity.sql` – main database schema
  - `date_test.sql` – test data
  - `triggers.sql` – database triggers
- Implemented services for main entities:
  - `CashBoxServiceImpl`, `MemberServiceImpl`, `MonthlyExpenseServiceImpl`, `MonthlyFeeServiceImpl`.
- Added `FeeCalculator` to centralize fee-related calculations.


---

## 🚀 Next Steps

Planned features and improvements:

 - Implement CRUD for Roles & Users
 - Add Authentication & Authorization (JWT + Spring Security)
 - Add Unit & Integration Tests
 - Add Docker support for easier deployment
 - Deploy to cloud (Heroku, AWS, or similar)




