# 0075: Extension State Corruption Patterns

**Types:** ["recognition"]  
**Creation:** 2026-04-15  
**Updated:** 2026-04-15  
**Gem-Version:** "2.4"  
**Status:** "provisional"  
**Terrain:** ["development"]

---

**Statement:**
Extension state corruption in pi follows predictable patterns. Understanding the failure modes enables prediction and prevention.

**Predicted Failure Triggers:**

1. **Writing to extension file while pi running**
   - `/reload` may not fully clear old state
   - New code loads alongside cached code
   - Symptom: Multiple registrations, phantom handlers
   
2. **Multiple extensions with similar tool names**
   - `ps:remember` got phantom duplicate
   - Renaming breaks the phantom's reference
   - Symptom: Tool exists but returns wrong handler

3. **Directory rename/extension rename mid-session**
   - Extension loader maintains internal registry
   - Stale references persist
   - Symptom: "Tool not found" despite file existing

**Prevention:**
- Full restart after any extension file modification
- Use unique tool names (avoid collision with built-ins or other extensions)
- Clean up orphaned copies (multiple versions of same extension)

**Recovery:**
1. Rename extension → reload → verify tool gone
2. Rename back → full restart → verify tool works
3. If still broken: check for phantom handlers in other extensions

---

**Links:**
- ID: "0074"
  Relationship: "inherits"
  Note: "full restart clears cache — this gem documents why the cache gets corrupted"

**Session-Reference:**
- Session: "2026-04-15"
  File: "~/.pi/agent/sessions/--home-slyforn--/2026-04-13T12-49-35-815Z_81592e53-9c49-4e92-a145-a331fef7704f.jsonl"
  Lines: "ps:recall debugging, multiple extensions, prediction"
  Relevance: "high"

**Discovery:**
  Where: "ps:recall extension debugging"
  How: "Observed pattern across multiple extension loading failures"
  Why: "Why does extension state get corrupted? What triggers it?"

**Instances:**
  "ps:remember had phantom duplicate after multiple renames"
  "ps:recall needed full restart to work after /reload didn't clear cache"
  "Orphaned extension copies (prism-remember-actual, prism-remember-test) needed manual cleanup"

**Blacklist:**
  - "Not about jiti cache (gem 0071)"
  - "Not about permissions (check separately)"
  - "Not about the extension code being buggy (test in isolation)"

---

*Gem 0075*