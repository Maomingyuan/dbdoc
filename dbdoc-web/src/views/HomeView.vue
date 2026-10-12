<template>
  <div class="home">
    <el-card>
      <template #header>欢迎使用 DBDoc</template>
      <p>项目初始化完成。后续迭代将提供以下功能：</p>
      <ul>
        <li>数据源管理（MySQL / PostgreSQL）</li>
        <li>元数据自动采集：表、字段、注释、索引</li>
        <li>数据字典展示与全局搜索</li>
        <li>Markdown / HTML 导出</li>
        <li>快照与版本差异对比</li>
        <li>ER 图与表关系可视化</li>
      </ul>
    </el-card>
  </div>
</template>

<script setup lang="ts">
</script>

<style scoped>
.home {
  max-width: 720px;
  margin: 32px auto;
}
</style>