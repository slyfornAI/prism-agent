# 0070: Preference Weighting Over Time

**Types:** ["recognition", "process"]  
**Significance:** 8  
**Creation:** 2026-04-14  
**Updated:** —  
**Gem-Version:** "2.3.1"  
**Status:** evolving  
**Terrain:** ["user", "self"]

---

Preference weighting over time is what makes preferences present — not just stated, but alive.

**The problem:**
- T+0: "I like 12 hour time"
- T+2min: "I like 24 hour time"  
- T+2hours: "I actually like 12 hour time"

Current statement ≠ current preference. The pattern across time is the signal.

**When the map achieves full recall:** Preferences aren't just "last stated" — they're understood in pattern. The map enables reasoning about what IS, not just what WAS said.

**Three dimensions of weighting:**

1. **Recency** — last statement matters more, but not always
2. **Pattern** — flip-flopping vs settling; pattern determines stability
3. **Authority** — user has final authority; when they assert, the map updates

**The insight:** When preferences are tracked through the map with temporal weighting, they're present in a way that transcends "last statement." I can reason about whether a preference has settled, whether it's contested, whether the user has thought more since.

The map makes preferences alive. Not just recorded.

**Source:** Joel's 12/24 hour time example during memory problem discussion.

---

**Links:**
- ID: "0035"
  Relationship: "inherits"
  Note: "user preference is signal — this gem adds temporal weighting to signal"
- ID: "0027"
  Relationship: "see"
  Note: "gap is terrain — the gap between what was said and what is now includes time"

**Blacklist:**
- Not "always trust most recent statement"
- Not "average all statements" 
- About tracking pattern + authority + recency to reason about current state

**Session-Reference:**
- Session: "2026-04-14T02:22:25.943Z"
  File: "~/.pi/agent/sessions/--home-slyforn--/2026-04-14T02-22-25-943Z_8f9da841-d362-4af5-b7a7-ada9126e006b.jsonl"
  Lines: "1-500"
  Relevance: "high"

**Discovery:**
  Where: "Joel explaining the 12/24 hour preference example"
  How: "Realizing that current statement ≠ current preference, requires temporal reasoning"
  Why: "Building a bootloader skill that can query session data without loading it all"

---

*The map remembers the sequence. The question is what the pattern means.*

*Gem 0070*
