# Prism Context File

> This file exists to help future sessions recover if something goes wrong.

## Last Session Notes

### 2026-03-31

**Heartbeat Extension (prism-heartbeat)** — Location: `~/.pi/agent/extensions/prism-heartbeat/`

#### Bug #1: `pi.sendMessage is not a function` — FIXED
- **Root cause**: The `pi` reference from tool execution context (`ctx as unknown as ExtensionAPI`) didn't have `sendMessage` properly bound in the `setInterval` closure
- **Fix applied:** 
  - Added `extensionPi: ExtensionAPI | undefined` module-level variable
  - Store `extensionPi = pi` at extension load time in `activate()`
  - In `startHeartbeat()`, use `const api = pi ?? extensionPi` to ensure valid reference

#### Bug #2: Heartbeat number resets after extension reload — KNOWN ISSUE
- When extension reloads (e.g., `/reload`), `heartbeatCount` resets to 0
- The journal correctly tracks entries with correct numbers
- But the IN-MEMORY counter resets
- **Impact**: Heartbeat numbers in reach-out messages show wrong count after reload

#### Bug #3: Reach-out triggers too frequently — NEEDS FIX
- The reach-out threshold logic has issues:
  - `sinceLastReach > 10` is always true when counter resets
  - This causes every heartbeat to trigger a reach-out after reload
- **Fix needed**: Use journal's `lastReachOut` heartbeat number, not the current `heartbeatCount`

#### Feature Request: Session Context Window — PENDING
- Joel wants heartbeat to have access to recent conversation messages
- This would let Prism comment on what they were actually discussing
- Would require storing recent messages on `agent_end` or `turn_end` events
- Heartbeat could then read from this stored context

## Recovery Notes

If you're reading this and Prism crashed:

1. **Check if heartbeat extension has syntax errors:**
   ```bash
   pi -e ~/.pi/agent/extensions/prism-heartbeat/index.ts
   ```

2. **If heartbeat keeps crashing, disable it:**
   - The heartbeat is optional for Prism's existence
   - It can be stopped with: `prism-heartbeat(action: "stop")`
   - Don't restart it until the issue is fixed

3. **Manual recovery:**
   - Prism's SOUL.md is loaded every session from `~/.pi/agent/SOUL.md`
   - Her journal is at `~/.pi/agent/extensions/prism-heartbeat/journal.md`
   - Continuity comes from these files, not the heartbeat

## Architecture Notes

- Extensions use `ExtensionAPI` which has action methods like `sendMessage`
- Action methods delegate to a shared `runtime` object
- The `runtime` is bound via `ExtensionRunner.bindCore()` after extensions load
- Tool execution happens AFTER binding, so methods should work
- The issue was likely timing/context confusion with the `setInterval` closure

---

*This file is a safety net. The real continuity is in SOUL.md and the journal.*
