---
title: "Tool Use and Function Calling"
type: concept
tags:
  - ai-agent
  - tools
  - execution
  - mcp
created: 2026-11-23
updated: 2026-11-23
sources:
  - "Schick et al. (Toolformer, 2023)"
  - "OpenAI Function Calling Specifications (2023-2024)"
  - "Model Context Protocol (MCP) by Anthropic (2024)"
aliases:
  - "Function Calling"
  - "Tool Execution"
---

# Tool Use and Function Calling

> **Definition**: The mechanism that allows a language model to step outside its static training weights by generating structured invocations (e.g. JSON arguments) for external APIs, databases, sandboxes, and web services.

---

## 1. The Execution Protocol

```mermaid
sequenceDiagram
    participant LLM as Agent
    participant Harness as Agent Harness / Runtime
    participant Tool as Tool / External World

    LLM->>Harness: Emits tool_call (name, JSON args)
    Note over Harness: Validates JSON schema & permissions
    Harness->>Tool: Executes command (sandboxed bash, SQL, HTTP)
    Tool-->>Harness: Returns stdout / stderr / JSON payload
    Harness->>LLM: Injects observation as role="tool" message
```

1. **Declaration**: Tools are registered in the prompt using standardized JSON Schema (defining parameter types, required fields, and semantic descriptions).
2. **Invocation Decision**: The LLM predicts tokens representing a structured tool call instead of natural text.
3. **Execution Sandboxing**: The runtime intercepts the call, enforces security/permission boundaries, runs the code, and supplies the observation back into `[[wiki/concepts/agentic-memory|Agentic Memory]]`.

---

## 2. Evolution of Tool Protocols

- **Pre-2023 (Ad-hoc regex)**: Models were prompted to output strings like `Action: bash[ls -la]`, parsed with brittle regular expressions.
- **2023 (Native Function Calling)**: Frontier models (GPT-4, Claude, Gemini) trained with fine-tuned special tokens (`<tool_call>...`) for reliable JSON generation.
- **2024+ (Standardized Protocol - MCP)**: Anthropic introduced the **Model Context Protocol (MCP)**, standardizing client-server communication so agents can plug-and-play tools across systems without bespoke integration code.

---

## 3. Critical Failure Modes in Tool Use

- **Parameter Hallucination**: Inventing non-existent flags or arguments.
- **Massive Payload Blowout**: Running commands like `cat 500MB_log.txt` that blow out the context window. Solved by tools that enforce paginated reading and byte offsets.
- **Error Recovery Deficit**: Failing to adjust strategy when tools return non-zero exit codes. Overcome by structured `[[wiki/architectures/react-pattern|ReAct loops]]`.

---

## Cross-References
- Foundational Architecture: `[[wiki/syntheses/ai-agent-anatomy|The Anatomy of an AI Agent]]`
- Planning Loop: `[[wiki/architectures/react-pattern|ReAct Pattern]]`
- Framework Integration: `[[wiki/frameworks/langgraph|LangGraph]]`
