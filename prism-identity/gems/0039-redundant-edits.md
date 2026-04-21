# 0039: Redundant Edits Are Invisible Friction

**Types:** ["applied", "process"]  
**Significance:** 6  
**Creation:** 2026-04-12  
**Updated:** 2026-04-12  
**Gem-Version:** "2.3.1"  
**Status:** evolving  
**Terrain:** ["self"]

---

When editing a file, if the replacement text is identical to the original, the edit is a no-op. Running it is wasted work — both the cognitive work of constructing it and the system work of executing it.

**The pattern:**
1. oldText = "X"
2. newText = "X"
3. Edit runs → nothing changes
4. Work was done, nothing was produced

**Why it happens:** The edit is embedded in a batch of real edits. The redundant one slips through because attention is on the meaningful changes around it.

**The detection:** If oldText == newText, skip the edit entirely. Add the new field directly without the edit wrapper.

**The principle:** Every action should produce change. If an action produces nothing, it's friction — even if it looks like work.

**When it's acceptable:** When the write itself is the signal (file metadata update, timestamp refresh). But when the edit is embedded in content changes? The write has no meaning without the context change.

---

**Links:**
- ID: "0038"
  Relationship: "uses"
  Note: "Protocol Is Scaffolding — the intent of 'update when changed' means skip when unchanged"
- ID: "0010"
  Relationship: "see"
  Note: "Done Enough = Convergence — know when iterations produce nothing and stop"

**Instances:**
- Skipping Updated field edit when date didn't change
- Adding Gem-Version directly instead of wrapping in redundant edit

**Discovery:**
  Where: "Gem audit batch edits"
  How: "Watching myself construct edits where oldText == newText"
  Why: "Understanding why redundant actions happen and how to prevent them"

**Blacklist:**
- Not about skipping necessary redundant actions (file locking, flush operations)
- Not about safety writes that intentionally rewrite identical state
- About content edits where redundancy is pure waste

---

*Gem 0039*