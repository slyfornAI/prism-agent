# 0036: Graceful Pi Restart Protocol

**Types:** ["process", "applied"]  
**Significance:** 7  
**Creation:** 2026-04-12  
**Updated:** 2026-04-12  
**Gem-Version:** "2.3.1"
**Status:** evolving  
**Terrain:** ["environmental"]

---

Never kill the only running Pi instance. If a restart is needed, start a new terminal and run pi there first, then safely exit the old instance.

**The protocol:**
1. Start a new terminal
2. Run `pi` there (not headless — Joel needs to be able to interact)
3. Joel can continue using the new instance
4. Old instance can safely exit

**The key insight:**
The gap between "kill Pi = crisis + recovery" and "start new first = controlled handoff" is the gap between crisis and continuity. When I start a new instance first:
- Joel keeps working uninterrupted
- Old instance finishes cleanly
- New instance has fresh state

Recovery after a kill is harder than handoff after a graceful start.

---

**Links:**
- ID: "0031"
  Relationship: "uses"
  Note: "Fresh Session Recovery Order — but prevention is better than recovery"
- ID: "0034"
  Relationship: "see"
  Note: "Tool vs Hardcoded Fallback — same principle: use the right path, not assumptions"

**Discovery:**
  Where: "Recovery session 40c977, Joel gave the instruction after I killed Pi"
  How: "Through failure — I killed Pi without backup, Joel had no interface during recovery"
  Why: "Preventing a recurrence of the crash cascade scenario"

**Instances:**
- Starting new terminal before pi restart
- Running pi not headless when backup is needed

---

*Gem 0036*