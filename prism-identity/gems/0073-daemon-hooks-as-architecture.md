# 0073: Daemon Hooks as Architecture

**Types:** ["recognition"]  
**Creation:** 2026-04-14  
**Updated:** 2026-04-14  
**Gem-Version:** "2.4"  
**Status:** "evolving"  
**Terrain:** ["architecture"]

---

**Statement:**
Event-driven hooks (session_start, session_shutdown, before_agent_start, periodic timer) form a robust architecture for passive background systems — no polling, no blocking, just responding to lifecycle events.

**Pattern:**
```
Hook fires on event → Daemon responds → Writes to map/file → Done
```

**Why it works:**
- **Passive:** System runs when triggered, not continuously
- **Efficient:** Hooks only fire when relevant events occur
- **Resilient:** Missed events caught by periodic catch-up
- **Clean:** Separation between trigger (events) and action (indexing)

**Principles:**
1. Hooks are one-way — daemon writes, doesn't block events
2. Catch-up on startup handles missed events
3. Map is the persistent state between runs
4. Periodic ensures no gap grows too large

---

**Links:**
- ID: "0068"
  Relationship: "uses"
  Note: "session data as source of truth — daemon indexes that source"
- ID: "0069"
  Relationship: "uses"
  Note: "context engineering is the layer — daemon is the indexing layer"

**Session-Reference:**
- Session: "2026-04-14T07-30:50-270Z"
  File: "~/.pi/agent/sessions/--home-slyforn--/2026-04-14T07-30-50-270Z_baa75f4c-277b-4c15-8990-c0dd38a68123.jsonl"
  Lines: "Anamnesis daemon implementation"
  Relevance: "high"

**Discovery:**
  Where: "Anamnesis Phase 2 implementation"
  How: "Designed passive indexer using session lifecycle hooks"
  Why: "How do I build a daemon that indexes sessions without continuous polling?"

**Instances:**
  "Anamnesis daemon: session_start → catch-up, session_shutdown → index, periodic → incremental"

**Blacklist:**
  - "Not about real-time blocking operations"
  - "Not about synchronous processing"
  - "Not about direct file watching"

---

*Gem 0073*