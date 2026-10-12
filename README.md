# DBDoc

> 数据库文档 / 数据字典管理平台：连接 MySQL / PostgreSQL，自动采集表结构、字段、注释、索引，生成可搜索、可导出、可对比的数据字典。

[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](LICENSE)

## 项目简介

DBDoc 面向开发、测试、运维和数据分析人员，解决以下问题：

- 数据库表结构文档缺失或长期不更新
- 字段注释、索引、主键信息分散
- 多环境数据库结构不一致
- 版本升级后表结构变更难以追踪
- 交接、评审、审计时缺少统一数据字典

## 技术栈

**后端**：Java 17、Spring Boot 3、Flyway、HikariCP、SpringDoc OpenAPI、MySQL（元数据库）

**前端**：Vue 3、Vite、TypeScript、Pinia、Vue Router、Element Plus、Axios

**部署**：Docker、Docker Compose、Nginx、GitHub Actions

## 快速开始

### 前置要求

- JDK 17+
- Node.js 20+
- MySQL 8.0+

### 准备元数据库

```sql
CREATE DATABASE dbdoc DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

表结构由 Flyway 在后端首次启动时自动初始化，无需手动执行。

### 启动后端

```bash
cd dbdoc-server
# Windows: mvnw.cmd spring-boot:run    Linux/macOS: ./mvnw spring-boot:run
./mvnw spring-boot:run
```

默认读取 `localhost:3306/dbdoc`，可通过环境变量覆盖：

| 环境变量            | 默认值       | 说明               |
| :------------------ | :----------- | :----------------- |
| `DBDOC_DB_URL`      | 见配置文件   | 元数据库 JDBC 地址 |
| `DBDOC_DB_USERNAME` | `root`       | 元数据库用户名     |
| `DBDOC_DB_PASSWORD` | `root`       | 元数据库密码       |

启动后访问 http://localhost:8080/actuator/health 验证。

### 启动前端

```bash
cd dbdoc-web
npm install
npm run dev
```

访问 http://localhost:5173

## 仓库结构

```
dbdoc/
├── dbdoc-server/       # Spring Boot 后端
├── dbdoc-web/          # Vue 3 前端
├── docs/               # 架构、API、数据库文档
├── .github/            # CI 与协作模板
├── LICENSE             # Apache-2.0
└── README.md
```

## 路线图

- [x] 第 1 周：项目初始化（仓库、LICENSE、后端/前端脚手架、CI、元数据库设计、Flyway）
- [ ] 第 2 周：数据源管理（CRUD、连接测试、密码加密）
- [ ] 第 3 周：元数据采集（MySQL / PostgreSQL）
- [ ] 第 4 周：数据字典展示与全局搜索（v0.1.0）
- [ ] 第 2 个月：导出 Markdown/HTML、快照与 Diff、ER 图、登录权限（v0.2.0）
- [ ] 第 3 个月：Docker 部署、多数据库支持、测试与文档（v1.0.0）

## 开源许可

[Apache-2.0](LICENSE)。本项目为非商业开源项目，无付费版本、无商业支持。

## 贡献

欢迎贡献，请先阅读 [CONTRIBUTING.md](CONTRIBUTING.md)。