# 元数据库设计

> 元数据库默认使用 MySQL 8.0+，表结构由 Flyway 迁移脚本
> `dbdoc-server/src/main/resources/db/migration/V1__init_schema.sql` 初始化。

## ds_datasource（数据源）

| 字段               | 类型         | 说明               |
| :----------------- | :----------- | :----------------- |
| id                 | bigint       | 主键，自增         |
| name               | varchar(128) | 数据源名称         |
| type               | varchar(32)  | mysql / postgresql |
| host               | varchar(255) | 主机               |
| port               | int          | 端口               |
| database_name      | varchar(128) | 数据库名           |
| username           | varchar(128) | 用户名             |
| password_encrypted | varchar(512) | 加密密码           |
| status             | varchar(32)  | 状态               |
| created_at         | datetime     | 创建时间           |
| updated_at         | datetime     | 更新时间           |

## meta_table（表元数据）

| 字段          | 类型          | 说明       |
| :------------ | :------------ | :--------- |
| id            | bigint        | 主键，自增 |
| datasource_id | bigint        | 数据源 ID  |
| table_name    | varchar(128)  | 表名       |
| table_comment | varchar(1024) | 表注释     |
| engine        | varchar(64)   | 引擎       |
| charset       | varchar(64)   | 字符集     |
| created_at    | datetime      | 创建时间   |
| updated_at    | datetime      | 更新时间   |

唯一约束：`(datasource_id, table_name)`。

## meta_column（字段元数据）

| 字段             | 类型          | 说明       |
| :--------------- | :------------ | :--------- |
| id               | bigint        | 主键，自增 |
| table_id         | bigint        | 表 ID      |
| column_name      | varchar(128)  | 字段名     |
| column_type      | varchar(128)  | 字段类型   |
| column_comment   | varchar(1024) | 字段注释   |
| nullable         | tinyint       | 是否可空   |
| default_value    | varchar(512)  | 默认值     |
| ordinal_position | int           | 顺序       |
| created_at       | datetime      | 创建时间   |
| updated_at       | datetime      | 更新时间   |

唯一约束：`(table_id, column_name)`。

## 说明

- 索引元数据（meta_index）、快照表（meta_snapshot）将在第 3、6 周迭代中补充
- `nullable` 存在保留字风险，DDL 中以反引号转义