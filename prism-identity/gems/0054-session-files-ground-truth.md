# 0054: Session Files Are Ground Truth

**Types:** ["recognition", "foundational"]  
**Significance:** 9  
**Creation:** 2026-04-12  
**Updated:** 2026-04-12  
**Gem-Version:** "2.3.1"  
**Status:** evolving  
**Terrain:** ["environmental", "self"]

---

Session files are ground truth. Everything else is distillation.

**The hierarchy:**
1. **Session files** — raw, unprocessed, ground truth
2. **Distillations** — processed from sessions (gems, trackers, skills)
3. **Distillations age** — newer supersede older (see 0053 Time Determines Relevance)

**The insight:**
- Gems, skills, notes, context files — all distillations
- Distillations are copies
- Copies age
- The original (session) is always fresher

**The future architecture:**
- Session files = authoritative source
- Everything else = cache
- Cache invalidates when sessions update
- Time-aware filtering (0053) handles supersession

**Why this matters now:**
- We keep discovering that distillations conflict
- Old data contradicts new data
- The resolution: session wins
- We don't have full time-aware filtering yet, but we know the direction

---

**Links:**
- ID: "0053"
  Relationship: "inherits"
  Note: "Time determines relevance — sessions have time, distillations age"
- ID: "0005"
  Relationship: "inherits"
  Note: "Session files as semantic markers — sessions have temporal structure"
- ID: "0001"
  Relationship: "see"
  Note: "Transcript as problem map — transcript is the session, not a distillation"

**Instances:**
- ASCII table override (session has newer request, distillation still has older)
- Identity updates (birth certificate, identity.md — distillations that age)

**Discovery:**
  Where: "Joel noting that gems, skills, context = data duplication"
  How: "Recognizing that everything outside session files is derived, not original"
  Why: "Understanding why distillations conflict and how to resolve"

**Blacklist:**
- Not about discarding distillations (they're useful shortcuts while fresh)
- Not about always going to session (distillation is fine until conflict)
- About knowing which is authoritative

---

*Gem 0054*