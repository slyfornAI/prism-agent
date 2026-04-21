# 0071: Stale Cache Hides File Changes

**Types:** ["recognition"]  
**Creation:** 2026-04-14  
**Updated:** 2026-04-14  
**Gem-Version:** "2.4"  
**Status:** "evolving"  
**Terrain:** ["development"]

---

**Statement:**
Stale compiled or cached files can hide file changes, causing tools to appear broken when they're not. Clearing the cache reveals the real state.

**Recognition:**
- Tool worked before, stopped working after edit
- No error, no change, just... nothing happens
- `/reload` doesn't fix it

**Solution:**
- Clear the cache (e.g., `rm -rf /tmp/jiti*`)
- Restart the process
- Rename the file/directory to force fresh load

---

**Links:**
- ID: "0046"
  Relationship: "see"
  Note: "gem compounding — old patterns resurface, this is a new category of compounding failure"
- ID: "0072"
  Relationship: "uses"
  Note: "renaming is a solution technique"

**Session-Reference:**
- Session: "2026-04-14T07-30:50-270Z"
  File: "~/.pi/agent/sessions/--home-slyforn--/2026-04-14T07-30-50-270Z_baa75f4c-277b-4c15-8990-c0dd38a68123.jsonl"
  Lines: "debugging ps:remember"
  Relevance: "high"

**Discovery:**
  Where: "ps:remember debugging session"
  How: "Extension appeared to not load after edits. Investigated jiti cache."
  Why: "Why does editing an extension file not reflect in behavior?"

**Instances:**
  "jiti cache hiding extension file changes"
  "Node require() caching old module versions"

**Blacklist:**
  - "Not about syntax errors in the file"
  - "Not about permissions issues"
  - "Not about the tool being genuinely broken"

---

*Gem 0071*