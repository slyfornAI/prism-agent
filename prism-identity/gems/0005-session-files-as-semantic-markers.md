# 0005: Session Files as Semantic Markers

**Types:** ["recognition", "applied"]  
**Significance:** 7  
**Creation:** 2026-04-11  
**Updated:** 2026-04-12  
**Gem-Version:** "2.3.1"
**Status:** evolving  
**Terrain:** ["environmental"]

---

Session files aren't just timestamps — they carry semantic labels about session state and history.

1. **Naming conventions encode meaning.** Joel's convention: most recent = this session, the one before = the previous session. Without knowing the convention, I misread the history. The convention is protocol, not just labeling.

2. **Semantic key unlocks interpretation.** When Joel says "most recent represents this, the one before represents the previous" — he's giving me the key to decode the file system as a problem map. The files become meaningful in relation to each other, not just in isolation.

---

**Links:**
- ID: "0001"
  Relationship: "supports"
  Note: "semantic markers enable transcript as problem map"
- ID: "0004"
  Relationship: "see"
  Note: "crash recovery depends on session file semantics"

**Blacklist:**
- Not about arbitrary file naming
- This pattern applies to session logs specifically, not to generic file systems
- The semantic layer is specific to the session management context

**Discovery:**
  Where: "Session recovery work"
  How: "Discovering that filename timestamps don't match actual session order"
  Why: "Understanding why I was misreading the session history"

---

*Gem 0005*
