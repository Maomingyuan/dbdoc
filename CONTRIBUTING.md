# Contributing to DBDoc

感谢你对 DBDoc 的关注！本项目是非商业开源项目，欢迎任何形式的贡献。

## 开发环境

- JDK 17+
- Maven 3.9+（或使用项目内 Maven Wrapper）
- Node.js 20+
- MySQL 8.0+（元数据库）

## 分支模型

- `main`：主干分支，始终保持可发布状态
- `feature/*`：功能分支，从 `main` 切出，合并回 `main`
- `release/*`：发布分支

## 提交规范

遵循 [Conventional Commits](https://www.conventionalcommits.org/)：

```
<type>(<scope>): <description>
```

常用 type：`feat`、`fix`、`docs`、`style`、`refactor`、`test`、`chore`、`build`、`ci`

示例：`feat(datasource): add connection test endpoint`

## 提交流程

1. Fork 本仓库并克隆到本地
2. 从 `main` 创建功能分支：`git checkout -b feature/xxx`
3. 提交代码，确保 CI 通过
4. 发起 Pull Request，描述变更内容

## 行为准则

保持友善与尊重。本项目不接受任何商业化改造的 Pull Request（付费版、商业支持入口等）。