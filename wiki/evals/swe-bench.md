---
title: "SWE-bench: Benchmark for Software Engineering Agents"
type: eval
tags:
  - ai-agent
  - evaluation
  - benchmark
  - coding-agents
created: 2026-11-23
updated: 2026-11-23
sources:
  - "Jimenez et al. (SWE-bench: Can Language Models Resolve Real-World GitHub Issues?, ICLR 2024)"
aliases:
  - "SWE-bench"
  - "SWE-bench Lite"
  - "SWE-bench Verified"
---

# SWE-bench: Evaluating Software Engineering Agents

> **Definition**: SWE-bench is an automated evaluation benchmark that tests an agent's ability to resolve real-world software engineering issues gathered from popular open-source Python repositories on GitHub (e.g. `django`, `sympy`, `scikit-learn`, `pytest`).

---

## 1. How SWE-bench Works

1. **Input**: A real GitHub issue description (natural language + bug report) and the repo codebase at the commit immediately prior to the fix.
2. **Execution**: The agent runs in a sandboxed Linux environment equipped with `git`, shell access, python interpreters, and test harnesses.
3. **Output**: A git patch (`git diff`).
4. **Grading Criterion**: The patch is applied to a clean container and evaluated against the repo's actual unit tests:
   - Must turn failing tests related to the bug into passes (`FAIL_TO_PASS`).
   - Must NOT break any existing passing tests (`PASS_TO_PASS`).

---

## 2. Variants of the Benchmark

- **SWE-bench Full** (2,294 problems): The comprehensive original benchmark across 12 diverse repositories.
- **SWE-bench Lite** (300 problems): A curated, self-contained subset designed to reduce compute cost for rapid evaluation.
- **SWE-bench Verified** (500 problems): A human-validated subset created by OpenAI to eliminate ambiguous issue descriptions or under-specified unit tests.

---

## 3. Why SWE-bench is the Gold Standard for Agents

Unlike synthetic coding puzzles (e.g. HumanEval, LeetCode) which test localized zero-shot function completion:
1. **Massive Context**: Requires navigating repositories with hundreds of thousands of lines of code.
2. **Tool Discipline**: The agent must use bash, grep, file finders, file editors, and run test suites iteratively.
3. **Execution Grounding**: The agent can only succeed through iterative debugging (`[[wiki/architectures/react-pattern|ReAct loops]]`), not by guessing in one shot.

---

## Cross-References
- Overarching Model: `[[wiki/syntheses/ai-agent-anatomy|The Anatomy of an AI Agent]]`
- Tool Execution in Benchmarks: `[[wiki/concepts/tool-use-and-function-calling|Tool Use & Function Calling]]`
- Planning and Reflection: `[[wiki/architectures/react-pattern|ReAct Pattern]]`
