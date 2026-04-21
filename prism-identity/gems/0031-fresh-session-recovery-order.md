# 0031: Fresh Session Recovery Order

**Types:** ["process", "applied"]
**Significance:** 7
**Creation:** 2026-04-12
**Updated:** 2026-04-12  
**Gem-Version:** "2.3.1"
**Status:** evolving  
**Terrain:** ["environmental"]

---

When starting fresh after a crash, there's a correct escalation path. Skip steps and you add latency.

**The order:**

1. **`ps:session-map`** - lightweight overview, gets you size/word/gems/keywords, helps orient before diving
2. **Extract actual file paths** - the tool output contains real paths, don't assume a path, use the path from the tool
3. **Check file exists** - `ls` or `test -f` before reading
4. **Parse metadata only** - session entry, model changes, custom events - the structural layer first
5. **Escalate to full JSONL read** - only if metadata indicates the content is relevant

**Why this order:**
- Session-map is instant, gives orientation without commitment
- Actual paths from tool output > hardcoded assumptions
- File existence check avoids errors on stale references
- Metadata tells you what kind of session before you commit to reading it
- Full JSONL read is expensive - save it for sessions that matter

---

**The failure that taught this:**
- Jumped straight to bash `tail ~/.pi/sessions/...` with hardcoded path
- Assumed `~/.pi/sessions/` existed - it didn't
- Tool output showed correct path was `~/.pi/agent/sessions/--home-slyforn--/`
- Bypassed the tool's stored knowledge by falling back to manual guess

**Correct behavior:** Use the path from the tool output, not a guessed alternative.

---

**Links:**
- ID: "0004"
  Relationship: "uses"
  Note: "crash recovery is the context; this is the correct process for it"
- ID: "0005"
  Relationship: "see"
  Note: "session files as semantic markers - the metadata layer that enables step 4"

**Blacklist:**
- Not about recovery after a crash during active work (different failure mode)
- Not about what to do during a session (this is fresh-start only)
- About the *sequence* - order matters, skipping adds latency

**Context:** Recovery session (b693253d) - crashed trying to read session files, found correct path via tool output after failing with hardcoded guess.

**Discovery:**
  Where: "Crash recovery session (b693253d)"
  How: "Discovering the correct sequence by watching what added latency when skipped"
  Why: "Understanding that order matters for efficient recovery"

---

*Gem 0031*