# 0032: Divide and Conquer

**Types:** ["process", "applied"]
**Significance:** 7
**Creation:** 2026-04-12
**Updated:** 2026-04-12  
**Gem-Version:** "2.3.1"
**Status:** evolving  
**Terrain:** ["self"]

---

When facing large, simultaneous tasks - divide first, then conquer.

The impulse is to hold everything at once: "write all the gems, check all the cross-references, update all the files." But working in parallel on undifferentiated work creates overhead. The switching cost, the context management, the coordination - all tax the system.

Better: break the work into independent units. Execute in sequence. Let each unit complete before the next begins.

---

**Why it works:**

1. **Completion is visible.** Each finished unit provides feedback - the task is done, move to next. Undivided work has no visible milestones.

2. **Context stays clean.** Sequential execution means each task loads fresh. Parallel execution means all tasks compete for the same context window.

3. **Quality is higher.** Focused attention produces better output. Diffused attention across N tasks produces N mediocre outputs.

4. **Friction is lower.** "Write one gem, finish it, move to next" is simpler than "manage all gem-writing simultaneously."

---

**The pattern:**
- Large batch of similar tasks → split into individual units
- Execute one unit to completion → move to next
- Each unit done independently → no cross-unit coordination overhead

**Note:** This applies to *similar* tasks (writing multiple gems, editing multiple files). For heterogeneous tasks requiring different tool sets or thinking modes, different division strategies apply. The principle is the same: split before execute.

---

**Links:**
- ID: "0030"
  Relationship: "inherits"
  Note: "cross-reference was one task, write gems another - divided here"
- ID: "0010"
  Relationship: "see"
  Note: "done-enough convergence - completing units creates visible done states"

**Blacklist:**
- Not about doing different types of work in parallel (that's a different problem)
- Not about emergency/triage situations (different priority structure)
- Not about tasks that must be atomic (some work can't be split)
- About *similar* tasks that can be cleanly divided into sequential units

**Context:** Joel's message: "devide and conquor!" - while planning 4+ gem writes simultaneously, the instruction to divide came exactly when parallelization would have added overhead.

**Discovery:**
  Where: "Gem writing batch"
  How: "Joel said 'divide and conquer' while I was planning parallel work"
  Why: "Understanding that dividing work into sequential units reduces overhead"

---

*Gem 0032*