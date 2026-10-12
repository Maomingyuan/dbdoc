<template>
  <el-container class="layout">
    <el-header class="header">
      <span class="logo">DBDoc</span>
      <span class="subtitle">数据库文档 / 数据字典管理平台</span>
    </el-header>
    <el-main>
      <router-view />
    </el-main>
  </el-container>
</template>

<script setup lang="ts">
</script>

<style>
html,
body,
#app {
  margin: 0;
  height: 100%;
}

.layout {
  min-height: 100vh;
}

.header {
  display: flex;
  align-items: center;
  gap: 12px;
  border-bottom: 1px solid var(--el-border-color);
}

.logo {
  font-size: 20px;
  font-weight: 600;
}

.subtitle {
  color: var(--el-text-color-secondary);
  font-size: 13px;
}
</style>