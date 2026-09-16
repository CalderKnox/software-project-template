# 测试体系（Test Suite）

目录编号即 CI 执行顺序；分层判据与反模式规范见各层 README。
本目录由 init-tests.sh 生成——条件层不用就删，示例目录（_ 前缀）改名或删除。

```text
tests/
├── README.md            # 速查表（含每层启用条件）+ CI 编排表
├── 00-unit/             # 单元（原 unit）
├── 01-integration/      # 集成（原 integration）
├── 02-contract/         # 契约（原 contract）
├── 03-property/         # 属性（原 property）
├── 04-snapshot/         # 快照（原 snapshot）
├── 05-regression/       # 🆕 回归归档：一事故一条，注释带根因+修复 hash
├── 06-visual/           # 🆕 视觉+无障碍（仅前端启用，不用就删）
├── 07-e2e/              # 端到端；BDD 作为 acceptance/*.feature 子目录存在，不单开层
├── 08-smoke/            # 🆕 部署后探活，与合成监控共用一套脚本
├── 09-load/             # 🆕 容量极限（与 10 是"绝对水位 vs 相对基线"的互补关系）
├── 10-performance/      # 性能回归（原 performance）
├── 90-quarantine/       # 🆕 隔离区，编号放最后 = 不进入正常执行链
├── fixtures/
└── helpers/
```

## 分层

| 目录            | 验证的契约                  | 启用条件             |
| --------------- | --------------------------- | -------------------- |
| 00-unit/        | 单个函数/类逻辑             | 总是                 |
| 01-integration/ | 模块协作 + 真实 I/O         | 总是                 |
| 02-contract/    | API/schema 对外稳定性       | 有对外接口           |
| 03-property/    | 任意输入下的不变式          | 有往返/解析/手写循环 |
| 04-snapshot/    | 输出结构稳定性              | 输出格式固定         |
| 05-regression/  | 真实事故的再防              | 总是                 |
| 06-visual/      | UI 渲染 + 无障碍            | 仅前端/移动端        |
| 07-e2e/         | 核心业务闭环                | 有用户流程           |
| 08-smoke/       | 部署后环境健康              | 有部署动作           |
| 09-load/        | 容量极限水位                | 有容量目标           |
| 10-performance/ | 相对基线不劣化              | 有 SLO 路径          |
| 90-quarantine/  | flaky 测试隔离（不阻塞 CI） | 随第一起 flaky 启用  |

fixtures/（静态共享数据）、helpers/（factory/fake/时钟/scrubber）不参与编号。
