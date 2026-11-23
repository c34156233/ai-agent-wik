# LangGraph - Workflows and Agents

來源：
https://docs.langchain.com/oss/python/langgraph/workflows-agents

## 摘要

LangGraph 提供建構工作流程與 Agent 的 Graph 架構。

## Graph 元件

### Node

執行一個工作。

例如：

- Search Node
- Generate Node
- Validation Node

### Edge

連接節點。

### State

保存 Agent 狀態。

## Loop

Agent 可以根據檢查結果重新執行。

例如：

Generate
↓
Validate
↓
Pass ?

No → Generate

Yes → Output

## 優點

- 支援複雜流程
- 支援循環
- 支援條件判斷
- 支援 Agent 狀態管理

## 重點結論

Graph 非常適合建構具備自我修正能力的 Agent。