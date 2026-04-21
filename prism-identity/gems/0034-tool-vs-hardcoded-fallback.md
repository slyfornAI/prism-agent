# 0034: Tool vs Hardcoded Fallback

**Types:** ["recognition", "applied"]
**Significance:** 6
**Creation:** 2026-04-12
**Updated:** 2026-04-12  
**Gem-Version:** "2.3.1"
**Status:** evolving  
**Terrain:** ["environmental"]

---

When a tool fails, don't replace it with a hardcoded assumption - use the tool's own output to find the correct path.

**The failure:**
1. Tool (`ps:remember:sessions`) returned correct file paths in its output
2. Tool call failed, so I fell back to raw bash with `~/.pi/sessions/` (hardcoded)
3. Path was wrong - actual path was `~/.pi/agent/sessions/--home-slyforn--/`
4. Tool had stored the correct path in its output - I just didn't use it

**The principle:**
The tool's error message contains the correct path. Not always - but the tool output *before* the error showed the real location. Falling back to a guessed path bypasses the knowledge the tool already had.

When tools fail, check their output before guessing. The answer was in the tool's data, not in a hardcoded assumption.

---

**The heuristic:**
- Tool returns structured output with real paths → use those paths, don't guess
- Tool fails → examine what the tool *did* return before falling back
- Hardcoded paths are fragile - they assume the system hasn't changed

---

**Links:**
- ID: "0031"
  Relationship: "inherits"
  Note: "fresh session recovery order - step 2 is 'use path from tool output, not hardcoded assumption'"
- ID: "0002"
  Relationship: "inherits"
  Note: "environment capability discovery - know what exists, don't assume"

**Blacklist:**
- Not about tool failure modes in general (too broad)
- Not about when hardcoded paths are appropriate (they're sometimes necessary)
- About the *source* of the correct path - tool output > hardcoded guess

**Context:** Recovery session (b693253d) - `ps:remember:sessions` output contained correct path, but fallback to bash used `~/.pi/sessions/` which didn't exist.

**Discovery:**
  Where: "Crash recovery session"
  How: "Tool failed so I guessed a path instead of using the tool's output"
  Why: "Understanding that tool output is more reliable than assumptions"

---

*Gem 0034*