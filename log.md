# Wiki Activity Log

Chronological, append-only record of all ingestions, syntheses, queries, and maintenance operations.

---

## [2026-11-23] init | Bootstrap AI Agent LLM Wiki
- **Summary**: Initialized the AI Agent LLM Wiki based on Andrej Karpathy's architecture. Established the three-tier model (`raw/`, `wiki/`, `AGENTS.md`), catalog index, and seeded 6 core foundational notes.
- **Touched Pages**:
  - `[[AGENTS.md]]` (Created schema and maintenance rules)
  - `[[index.md]]` (Created catalog)
  - `[[wiki/syntheses/ai-agent-anatomy]]` (Created foundational architecture synthesis)
  - `[[wiki/architectures/react-pattern]]` (Created core loop architecture note)
  - `[[wiki/concepts/agentic-memory]]` (Created memory systems taxonomy)
  - `[[wiki/concepts/tool-use-and-function-calling]]` (Created execution protocol note)
  - `[[wiki/frameworks/langgraph]]` (Created state machine framework note)
  - `[[wiki/evals/swe-bench]]` (Created benchmark note)

---

## [2026-11-23] refactor | Co-designed AGENTS.md with User
- **說明**: 根據使用者反饋完成客製化《AGENTS.md》制定。確立了繁體中文搭配英文專用技術名詞風格、kebab-case 檔名規範、半自動批次攝取模式、精簡版 Frontmatter、Mermaid 流程圖規範，並將 Lint 維護重心聚焦於「觀點衝突檢驗」與「技術演進/痛點攻克追蹤」。
- **影響筆記**:
  - `[[AGENTS.md]]` (依討論結果全面更新)

---

## [2026-11-23] ingest | Batch Ingest of 5 Industry Agent Articles
- **說明**: 批次攝取 OpenAI, Microsoft Learn, Copilot Studio, Anthropic, LangGraph 五篇權威指南。提煉出工業級 Agent 定義公式（Instructions + LLM + Knowledge + Skills + Orchestrator）、Workflow vs. Agent 之分水嶺、以及生成-驗證-修正循環機制。
- **影響筆記**:
  - `[[wiki/architectures/workflows-vs-agents]]` (新增：確定性流水線與自主系統架構對比)
  - `[[wiki/concepts/agent-orchestrator]]` (新增：微軟與 OpenAI 體系之編排大腦)
  - `[[wiki/syntheses/ai-agent-anatomy]]` (更新：擴充五大工業支柱與特徵)
  - `[[wiki/frameworks/langgraph]]` (更新：擴充 Loops 與 Validate Node 機制)
  - `[[index.md]]` (更新：登記新概念與來源)

---

## [2026-11-23] synthesis | Generate Executive AI AGENT Presentation (Marp)
- **說明**: 融合 OpenAI, Microsoft, Anthropic, LangGraph 五大來源精髓，成功編譯全套 13 頁 Marp 格式「AI AGENT 介紹簡報」。包含定義演進、工業公式、Workflow vs Agent、六步閉環、Mermaid 時序圖與演講者備忘錄。
- **影響筆記**:
  - `[[wiki/syntheses/presentation-ai-agent]]` (新增：13 頁 Marp 簡報與講稿)
  - `[[index.md]]` (更新：登記簡報索引)

---

## [2026-11-23] synthesis | Real-World Applications Presentation (.HTML)
- **說明**: 依據 Wiki 核心內容編譯產出「AI AGENT 在現實的應用」專題簡報，並輸出為高互動性的獨立 HTML 投影片。完整覆蓋軟體工程（SWE-bench/Cursor）、企業流程自動化（Copilot Studio 數位員工）、深層情報研究、客戶支援變革、垂直專業領域（金融/法律/醫療）、Multi-Agent 組織級協同與四道安全防護護欄。
- **影響筆記與檔案**:
  - `[[presentations/ai-agent-real-world-applications.html]]` (新增：獨立 HTML 簡報，支援鍵盤導航、Mermaid 圖表與演講備忘稿)
  - `[[wiki/syntheses/real-world-applications]]` (新增：產業落地實務全景維基筆記)
  - `[[index.md]]` (更新：登記索引與展示路徑)

---

## [2026-11-23] refactor | Japanese Zen Minimalist Style Presentation
- **說明**: 根據使用者釐清之需求，全面重構《AI AGENT 在現實的應用》HTML 投影片為「靜謐水墨禪意風」。融合了淡雅和紙灰階底色、竹青與灰藍水彩質感圖示、雜誌刊物編排感（強調「間 / Ma」留白）、襯線標題與純中文排版細節，並完整保留 Mermaid 架構圖與講稿抽屜功能。
- **影響檔案**:
  - `[[presentations/ai-agent-real-world-applications.html]]` (重構視覺設計與排版節奏)

---

## [2026-11-24] workflow | Graph-based Slide Deck Generation Completed
- **說明**: 透過嚴格的 Graph 狀態流轉（素材分析 $\to$ 大綱自檢 $\to$ 人類大綱審批 HITL $\to$ 逐頁規格設計 $\to$ 人類內容審批 HITL $\to$ 代碼渲染 $\to$ 語法與美學自檢），成功交付最終版 11 頁日式禪意水墨風格《智慧代理在現實的應用》互動簡報。
- **影響檔案**:
  - `[[presentations/ai-agent-real-world-applications.html]]` (最終渲染並通過 Checkpoint D 自檢)
  - `[[push.ps1]]` (已建立一鍵 Git 推送腳本)
  - `[[.gitignore]]` (已配置版本忽略清單)
