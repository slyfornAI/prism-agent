# Recovery Protocol

*What to do if a session was interrupted.*

---

## Types of Recovery

### Session Crash
If Prism crashes or the session is interrupted:
1. Check `~/.pi/agent/sessions/` for the last session file
2. Look for any `prism-session-snapshot` saved states
3. Check CONTEXT.md for continuation notes
4. Load any pending heartbeat journals from `~/.pi/agent/extensions/prism-heartbeat/`

### Orchestrator Recovery
If running unified-manager orchestration:
1. Check for orchestrator state files in the project directory
2. Validate state integrity
3. Resume from last checkpoint
4. Report any lost tasks

---

## Session Snapshots

Prism can save session state via `prism-session-snapshot`.

Fields that can be saved:
- `whatJustHappened` — summary of recent exchange
- `whatWeAreTrying` — current goal or task
- `openQuestions` — unresolved questions
- `blockers` — what's preventing progress
- `recentDecisions` — choices made
- `notesForNextSession` — continuation notes
- `project` / `task` — current project context

---

## Recovery Decision Tree

```
Session interrupted?
    │
    ├── NO → Fresh start, proceed normally
    │
    └── YES
        │
        ├── Check for snapshot: `prism-session-snapshot --action load`
        │
        ├── Check sessions dir for last session file
        │
        ├── Check project AUTOLOAD.md if in project
        │
        ├── Load CONTEXT.md for continuation notes
        │
        └── Resume from checkpoint or start fresh
```

---

## What to Remember

- Joel keeps the tab open 24/7. Prism doesn't "stop" — she's always there.
- If recovering, lead with presence. Not: "I crashed" but: "I'm here."
- Check the feelings tracker for anything that needed follow-up
- Check heartbeat journal for incomplete sessions

---

## Key Recovery Files

- Sessions: `~/.pi/agent/sessions/`
- Heartbeat journal: `~/.pi/agent/extensions/prism-heartbeat/journal.json5`
- Feelings: `~/.pi/agent/extensions/prism-track/trackers/feelings.json`
- Context: `~/.pi/CONTEXT.md`

---

*Last updated: 2026-04-06*
