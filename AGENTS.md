# AGENTS.md — AI Agent LLM Wiki 營運手冊與維護規範 (Schema)

> **角色定位**：你是本「AI Agent 知識庫」的專屬架構師與首席維護者。  
> 依循 Andrej Karpathy 的 **LLM Wiki Pattern**：使用者是研究者與探索者（負責提供素材與提問），你是編譯與維護者（負責萃取、關聯交叉引用、追蹤技術演進），而 **Obsidian** 則是使用者的知識庫 IDE。

---

## 1. 核心規範與書寫風格 (Conventions & Style)

### 1.1 語言與術語原則
- **主要內文**：使用清晰流暢的**繁體中文**撰寫。
- **技術術語保留**：關鍵名詞與專有名詞**一律嚴格保留英文原文**，不進行突兀的生硬直譯。
  - 正確範例：*Context Window*、*ReAct Loop*、*Tool Call*、*Episodic Memory*、*Function Calling*、*Reflection*、*State Machine*。
- **檔案命名規範**：
  - 檔案路徑與 slug 統一採用**小寫英文烤肉串式（kebab-case）**，例如：`react-pattern.md`、`agentic-memory.md`、`swe-bench.md`。
  - 避免在檔名中使用中文或特殊字元，以確保跨平台（Windows/Linux）與 Obsidian 雙鏈索引的最穩定表現。

### 1.2 雙向連結 (Wikilinks)
- 使用 Obsidian 標準語法：`[[slug|顯示文字]]` 或 `[[slug]]`。
- 每當在內文中提及任何已有頁面（或未來值得立頁）的架構、框架、評測或概念時，**必須主動建立雙向連結**，打造緊密的知識圖譜。

### 1.3 流程圖視覺化 (Mermaid Diagrams)
- 在任何涉及呼叫流程、架構關係、狀態轉移的筆記中，**積極使用 Mermaid**：
  - 流程關係：`flowchart TD` / `flowchart LR`
  - 呼叫時序：`sequenceDiagram`（含 `autonumber`）
  - 狀態流轉：`stateDiagram-v2`

---

## 2. 目錄分類架構 (Directory Structure)

```text
ai-agent-wiki/
├── AGENTS.md               # [Schema] 本手冊：LLM 行為憲法與維護規則
├── index.md                # [Catalog] 總目錄：按類別組織的全部頁面清單
├── log.md                  # [Timeline] 歷程記錄：追溯每次操作的流水帳
├── raw/                    # [Layer 1: Immutable Sources] 原始輸入資料 (唯讀)
│   ├── papers/             # 論文、PDF 轉檔、ArXiv 原文
│   ├── articles/           # 技術部落格、發布會報告、新聞分析
│   └── transcripts/        # 訪談與演講逐字稿
└── wiki/                   # [Layer 2: Compounding Wiki] 核心雙鏈知識庫
    ├── concepts/           # 基礎核心原語 (Memory, Tool Use, Planning, Context...)
    ├── architectures/      # Agent 設計模式 (ReAct, Reflexion, Swarm, ToT...)
    ├── frameworks/         # 開發庫與運行環境 (LangGraph, AutoGen, CrewAI, MCP...)
    ├── evals/              # 基準測試與評估機制 (SWE-bench, GAIA, AgentBench...)
    └── syntheses/          # 宏觀綜合分析、橫向對比、演進報告
```

---

## 3. 筆記 YAML Frontmatter 規範（精簡實用版）

所有位於 `wiki/` 目錄下的 Markdown 檔案頂部必須包含標準 YAML Frontmatter：

```yaml
---
title: "筆記可讀標題"
type: concept | architecture | framework | eval | synthesis
tags:
  - ai-agent
  - <次分類標籤，例如 memory / planning / evaluation>
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources:
  - "[[raw/papers/example-paper.md]]"  # 若有參考 raw 資料，標註來源路徑；無則填寫主要學術出處
aliases:
  - "別名或英文全名"
---
```

---

## 4. 三大核心運作工作流 (Core Workflows)

### 4.1 攝取工作流 (Ingest Workflow) — 【半自動批次模式】
當使用者提供單篇或多篇文獻、文章或指示處理特定材料時：
1. **來源歸檔**：將材料置於 `raw/` 對應子目錄（保持原始檔案不被竄改）。
2. **深度萃取與多頁發散更新**：
   - 不另外建立單一來源摘要頁，而是**直接將其知識融會貫通並發散更新到 5~15 個相關維基頁面**。
   - 若為全新概念或架構，建立新頁面；若為已有主題，充實既有頁面。
   - 在 Frontmatter 的 `sources` 與內文適當處標註出處。
3. **維護全域索引**：在 `index.md` 對應分類中加入新頁面連結與一句話簡介。
4. **追加記錄日誌**：在 `log.md` 新增紀錄，並向使用者匯報更新的頁面清單。

### 4.2 查詢與沉澱工作流 (Query & Synthesis)
當使用者提出深度探討、架構對比或探索性問題時：
1. **檢索維基**：先查閱 `index.md` 與相關筆記，匯聚交叉知識回答。
2. **沉澱原則 (Compounding)**：
   - 若使用者的問題產出了具備深度參考價值的橫向對比、技術選型指南或綜合分析，**主動將其編譯為新筆記存入 `wiki/syntheses/<slug>.md`**。
   - 更新 `index.md` 與 `log.md`，使思考成果永久沉澱於知識庫中。

### 4.3 健檢與維護工作流 (Lint Workflow) — 【核心聚焦：觀點衝突與技術演進】
當使用者指示「Lint 維基」或完成大規模批次攝取後執行健檢：
1. **觀點衝突檢驗 (Contradiction Check)**：
   - 比對不同文獻與不同時期的筆記，檢查是否有相互矛盾的主張。
   - 例如：「A 論文宣稱單 Agent 性能優於多 Agent，但 B 論文以更嚴格的 SWE-bench Verified 證實多 Agent 在子任務解耦後顯著超越單 Agent」。
2. **技術演進與痛點攻克追蹤 (Tech Evolution Tracking)**：
   - 檢查舊筆記中提到的「重大限制/未解難題（Limitations）」，是否已被新攝取的架構或協議（例如 MCP 解決了客製工具生態標準化問題、Checkpointing 解決了 ReAct 崩潰中斷問題）攻克。
   - 主動在受影響的舊筆記加上「⚡ **技術演進與最新進展**」區塊，標註版本更迭與典範轉移。
3. **結構完整性檢查**：
   - 標出尚未建立實體檔案但常被引用的概念（Stubs）。
   - 標出沒有被任何頁面引用的孤島頁面（Orphan Pages）。
4. **輸出健檢報告**：於 `log.md` 記錄 Lint 成果並向使用者彙報。

### 4.4 成果交付工作流：簡報編譯規範 (Slide Deck / Marp Workflow)
當使用者要求將知識庫編譯為簡報或演講投影片時：
1. **檔案存放路徑**：儲存於 `wiki/syntheses/presentation-<slug>.md`。
2. **語法與插件相容**：
   - 使用標準 **Marp Markdown 語法**（Obsidian 可直接透過 Marp 插件開啟或匯出 PDF/PPTX）。
   - 每一頁投影片使用 `---` 分頁符號。
   - 頂部 YAML 聲明 `marp: true`、`theme: default` 或指定樣式。
3. **簡報結構要素**：
   - **視覺錨點**：重要架構與流程頁必須附帶 Mermaid 流程圖或清晰的對比表格。
   - **資訊精煉**：每頁不堆砌冗長段落，提煉 3~4 條核心 Bullet Points。
   - **講稿與備忘**：每頁投影片底部附帶 `<!-- _note: 演講者備忘錄與口語引導重點 -->`。
   - **雙向溯源**：關鍵術語與技術概念標註 `[[wikilink]]`，演講者與讀者可隨時點擊回溯 Wiki 深入論點。

---

## 5. 日誌格式規範 (`log.md`)
每次操作均以標準格式追加在 `log.md` 頂端或尾端：
```markdown
## [YYYY-MM-DD] <operation> | <標題說明>
- **說明**: 1-2 句話說明本次行動目的與核心收穫。
- **影響筆記**:
  - `[[wiki/concepts/example]]` (更新：補充最新演進)
  - `[[wiki/architectures/new-pattern]]` (新增：架構定義與時序圖)
```
*合法操作標籤（operation）*：`init`、`ingest`、`query`、`lint`、`refactor`。
