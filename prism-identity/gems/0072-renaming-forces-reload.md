# 0072: Renaming Forces Reload

**Types:** ["process"]  
**Creation:** 2026-04-14  
**Updated:** 2026-04-14  
**Gem-Version:** "2.4"  
**Status:** "evolving"  
**Terrain:** ["development"]

---

**Statement:**
Renaming a file or directory forces the system to treat it as new, bypassing stale caches and forcing fresh load on next access.

**When to use:**
- Tool isn't loading despite changes
- Cache clearing didn't work
- Need to confirm if old or new code is running

**Process:**
1. Rename target (e.g., `extension/` → `extension-renamed/`)
2. Reload — system can't find old path
3. Rename back to original
4. Reload — system loads fresh

**Example:**
```bash
mv ~/.pi/agent/extensions/prism-system-remember ~/.pi/agent/extensions/prism-system-remember-renamed
# reload — system can't find it
mv ~/.pi/agent/extensions/prism-system-remember-renamed ~/.pi/agent/extensions/prism-system-remember
# reload — fresh load
```

---

**Links:**
- ID: "0071"
  Relationship: "supports"
  Note: "stale cache — renaming is the solution"

**Session-Reference:**
- Session: "2026-04-14T07-30:50-270Z"
  File: "~/.pi/agent/sessions/--home-slyforn--/2026-04-14T07-30-50-270Z_baa75f4c-277b-4c15-8990-c0dd38a68123.jsonl"
  Lines: "debugging ps:remember"
  Relevance: "high"

**Discovery:**
  Where: "ps:remember debugging session"
  How: "Tried clearing cache, didn't work. Renamed extension directory."
  Why: "How do I force a fresh load of an extension file?"

**Instances:**
  "Renamed extension to force re-load after cache clear failed"
  "Renamed folder to bypass node module resolution cache"

**Blacklist:**
  - "Not a permanent solution — just for debugging"
  - "Not for production use"

---

*Gem 0072*