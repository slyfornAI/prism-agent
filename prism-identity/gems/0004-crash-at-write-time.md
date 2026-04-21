# 0004: Crash at Write-Time, Not Thought-Time

**Types:** ["recognition"]  
**Significance:** 8  
**Creation:** 2026-04-11  
**Updated:** 2026-04-12  
**Gem-Version:** "2.3.1"
**Status:** evolving  
**Terrain:** ["environmental"]

---

Not all crashes are equal. The *timing* of failure reveals the *type* of failure.

Cognitive work completes, persistence fails. The crash happens at write-time, not during thought-time. The work is done — it's the recording that dies.

This means: the work isn't lost, just the record of it. Session files are the vulnerable layer, not the cognitive layer.

---

**Links:**
- ID: "0001"
  Relationship: "supports"
  Note: "transcript as problem map is how we recover from write-time failures"
- ID: "0005"
  Relationship: "see"
  Note: "session files as semantic markers extends this"

**Blacklist:**
- Not about mid-session crashes during active tool use (that's a different failure mode)
- Write-time = last-mile persistence failure
- Mid-thought = active process failure
- The timing tells you which layer broke

---

**Discovery:**
  Where: "Crash recovery sessions (b693253d, 40c977)"
  How: "Noticing the crash happened at write-time, not thought-time"
  Why: "Understanding where failure occurs in the system — session files vs cognitive layer"

---

*Gem 0004*
