# API 草案

> 统一前缀 `/api`，统一响应体与异常处理在第 2 周落地。

## 认证

| 方法 | 路径             | 说明     |
| :--- | :--------------- | :------- |
| POST | /api/auth/login  | 登录     |
| POST | /api/auth/logout | 退出     |
| GET  | /api/auth/me     | 当前用户 |

## 数据源

| 方法   | 路径                       | 说明       |
| :----- | :------------------------- | :--------- |
| GET    | /api/datasources           | 数据源列表 |
| POST   | /api/datasources           | 新增数据源 |
| PUT    | /api/datasources/{id}      | 编辑数据源 |
| DELETE | /api/datasources/{id}      | 删除数据源 |
| POST   | /api/datasources/{id}/test | 测试连接   |
| POST   | /api/datasources/{id}/sync | 同步元数据 |

## 元数据

| 方法 | 路径                         | 说明     |
| :--- | :--------------------------- | :------- |
| GET  | /api/datasources/{id}/tables | 表列表   |
| GET  | /api/tables/{id}             | 表详情   |
| GET  | /api/tables/{id}/columns     | 字段列表 |
| GET  | /api/tables/{id}/indexes     | 索引列表 |
| GET  | /api/search                  | 全局搜索 |

## 快照

| 方法 | 路径                            | 说明     |
| :--- | :------------------------------ | :------- |
| GET  | /api/datasources/{id}/snapshots | 快照列表 |
| POST | /api/datasources/{id}/snapshots | 创建快照 |
| GET  | /api/snapshots/{id}             | 快照详情 |
| GET  | /api/snapshots/diff             | 快照对比 |

## 导出

| 方法 | 路径                 | 说明          |
| :--- | :------------------- | :------------ |
| GET  | /api/export/markdown | 导出 Markdown |
| GET  | /api/export/html     | 导出 HTML     |