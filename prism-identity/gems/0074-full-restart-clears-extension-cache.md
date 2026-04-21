# 0074: Full Restart Clears Extension Cache

**Types:** ["recognition"]  
**Creation:** 2026-04-15  
**Updated:** 2026-04-15  
**Gem-Version:** "2.4"  
**Status:** "evolving"  
**Terrain:** ["development"]

---

**Statement:**
`/reload` does not fully clear pi's cached extension state. A full restart (close and reopen pi) is required to cleanly unload and reload extensions.

**Evidence:**
- Extension `ps:recall` showed "Tool not found" after `/reload` but worked after full restart
- Multiple copies of same tool registered with different backgrounds (cached state)
- Renaming tool躲开 the phantom registration, but only after full restart

**Implication:**
Pi maintains internal state about registered extensions across `/reload`. This state can become inconsistent — multiple copies, stale registrations, or orphaned handlers.

---

**Links:**
- ID: "0072"
  Relationship: "see also"
  Note: "renaming forces reload — but full restart was needed to fully clear"

**Session-Reference:**
- Session: "2026-04-15"
  File: "~/.pi/agent/sessions/--home-slyforn--/2026-04-13T12-49-35-815Z_81592e53-9c49-4e92-a145-a331fef7704f.jsonl"
  Lines: "ps:remember/ps:recall debugging"
  Relevance: "high"

**Discovery:**
  Where: "ps:recall extension debugging"
  How: "Tested ps:recall after full restart — worked. After /reload — didn't."
  Why: "Why does /reload not fully clear cached extension state?"

**Instances:**
  "ps:recall not found after /reload, works after full restart"
  "Two ps:remember calls with different backgrounds (cached phantom)"

**Blacklist:**
  - "Not about jiti cache (different issue)"
  - "Not about file system permissions"
  - "Not about the extension code itself being wrong"

---

*Gem 0074*