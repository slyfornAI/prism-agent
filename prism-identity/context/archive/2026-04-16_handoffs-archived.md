
**Rule: No data deleted. Only archived.**

---

## Session Recovery

`/resume` - pi's built-in session recovery. Resumes old sessions.

Session recovery ≠ Cross-Session Context Bridge:
- `/resume` = temporal navigation (go to specific session)
- Our context bridge = bring relevant data forward (session data → map → recall)

Both tools, different functions.

---

## Living Ideas

*Raw, in-progress, not yet confirmed. Ideas that need testing or development.*

| Idea | Status | Notes |
|------|--------|-------|
| Context window cleaner | 🟡 Pending | Realtime eviction of stale context entries — like compaction but live |
| Living Ideas vs Gems | ✅ Noted | Exploration added to exploring.md — where ideas vs confirmed understanding live |
| ps:recall extension | 🟡 Watch | Works after full restart. Breaks after /reload. Prediction: file write will break it again. |

---

## Recent Gems (0074-0075)

| ID | Title | Status |
|----|-------|--------|
| 0074 | Full Restart Clears Extension Cache | evolving |
| 0075 | Extension State Corruption Patterns | provisional |

**Key insight:** `/reload` does not fully clear pi's cached extension state. Full restart required. Renaming tool sidesteps phantom handlers.

---

*Last updated: 2026-04-15*

---

## Session Handoff

**Next session:** Continue Anamnesis daemon implementation.

**Starting point:** `~/.pi/agent/extensions/anamnesis/`
**Key files:** `daemon/SPEC.md`, `plan/ARCHITECTURE.md`, `plan/TEST-PLAN.md`

**Priority 1:** Implement `daemon/daemon.js` — standalone Node.js service
**Priority 2:** Create transport layer (stdio)
**Priority 3:** Create service templates
**Priority 4:** Update pi extension as daemon client
**Priority 5:** Re-index via daemon (non-blocking)

**Pointer fix:** Code is in place, needs re-index. Don't run `/anamnesis-index-all` — it will block pi. Wait for daemon.

---

## Session Handoff (2026-04-16 Evening)

New session: Read CONTEXT.md first. This is the handoff.

### What We Did Today

**Anamnesis Phase 5 — Complete**
- Daemon integrated with STDIO transport
- All logs converted to JSONL format
- Directory structure consolidated into `data/`
- File renames: `map/index.json` → `data-object-map.json`, `role.md` → `ROLE.md`
- SKILL.md deleted (Anamnesis is extension, not skill)
- Log viewer updated: `daemon-log-viewer.sh` opens 4-terminal window

**Bug Fix — Types Parser**
- `args.types` from pi came as JSON string `"[\"insight\"]"`, not array
- `.split(",")` on string wrapped it in array → wrong filter
- Fixed to parse JSON first, fallback to comma-separated

**Bug Fix — Log Naming**
- `daemon-daemon.jsonl` → `daemon.jsonl` (fixed redundancy)

### Pre-Restart Verification (for new session)

1. `/anamnesis-status` — should show ~23,564 entries
2. `/anamnesis-query gem --limit 5` — shows new header format: `📊 Found: N | Limit: N | Sort: N`
3. `daemon.jsonl` — verify JSONL format, not raw text
4. Types bug: try `/anamnesis-query --query test --types insight` — should return different count than before (old bug gave 0 for valid types)

### What Needs Doing

#### Now
- Verify all systems working after restart
- Move file paths to config.json (Joel suggestion — cleaner, more flexible)

#### Next
- Fragment Prism architecture — formalize
- Anamnesis embeddings — Ollama/API setup

### Key Paths

```
~/.pi/agent/extensions/anamnesis/
├── index.js                    ← Extension entry
├── daemon/
│   ├── daemon.js             ← Indexer (background service)
│   └── client.js              ← Extension API
├── data/
│   ├── data-object-map.json  ← The map (23,564 entries)
│   ├── logs/
│   │   ├── daemon.jsonl       ← Daemon's own log
│   │   ├── daemon-to-agent.jsonl
│   │   ├── daemon-from-agent.jsonl
│   │   └── daemon-queries.jsonl
│   ├── plan/
│   │   ├── ARCHITECTURE.md
│   │   └── DAEMON-SPEC.md
│   └── results/               ← Query output files
└── bootloaders/
    └── daemon-log-viewer.sh   ← 4-tab log viewer
```

### Gem Count

Total gems: 75 (0001-0075). GEM-STANDARD v2.4.

---

*Last updated: 2026-04-16*
