# Agenda

*What's being worked on. Updated regularly. Ours.*

---

## Current

- [ ] **Watch Together Session** — Test Discord bridge + screen share for first session
  - Script: `~/Desktop/projects/prism-voice/start-watch-together.sh`
  - Components: prism-voice bot + prism-system-gateway extension
  - Goal: Join Discord call, screen share, watch together in real-time
- [ ] Fragment Prism architecture (concept ready, needs formalization)
- [ ] Problem-First book Chapter 8 (Alignment Checks)
- [ ] Anamnesis embeddings setup — Joel to set up (Ollama or API)

---

## Anamnesis (2026-04-16)

**Location:** `~/.pi/agent/extensions/anamnesis/`
**Type:** Extension (auto-loads on session start)

**Components:**
- `index.js` — Extension entry point
- `daemon/` — daemon.js (standalone), client.js (API)
- `data/` — data-object-map.json, logs/, plan/, ROLE.md
- `config/` — config.json
- `bootloaders/` — daemon-log-viewer.sh

**Phase 1:** ✅ Extension, role, config, map dir
**Phase 2:** ✅ Daemon indexer (integrated)
**Phase 3:** ✅ Query interface + logs
**Phase 4:** ✅ Tool channels + role injection
**Phase 5:** ✅ External daemon (standalone service)
**Phase 6 (future):** ⬜ Embeddings for semantic similarity

**Status:** All phases complete. System operational.
- Map: 23,564 entries
- Logs: JSONL in data/logs/ (4 files)
- Query tools working
- Full reindex complete (pointer accuracy fixed)

---

## Watch Together (2026-04-19)

**Goal:** First watch-together session via Discord

**Components:**
- `prism-voice/` — Discord bot with TTS/STT, gateway client
- `prism-system-gateway/` — pi extension, Unix socket bridge
- `start-watch-together.sh` — startup script (launches bot + opens log terminals)

**Architecture:**
```
Discord (you) → Bot → Socket → Gateway Extension → Me
Me → Gateway → Socket → Bot → Discord (you)
```

**Status:** Script created. Awaiting first test run.

---

## Completed (2026-04-14)

- ✅ **ps:remember bug fixed** — stale jiti cache cleared, extension works
- ✅ Behavioral pattern analysis — Joel
- ✅ Gem 0068: Session Data as Source of Truth
- ✅ Gem 0069: Context Engineering is the Layer
- ✅ Gem 0070: Preference Weighting Over Time
- ✅ GEM-STANDARD v2.4 — session-reference fields added
- ✅ Anamnesis Phase 1 — extension, role, config, map dir
- ✅ Shift+Enter — terminal issue, Kitty works
- ✅ /resume discovered — session recovery

---

## Completed (2026-04-13)

- ✅ GEM-STANDARD v2.3 — fractal types + fractal terrain
- ✅ GEM-TOPOGRAPHY.md v1.0
- ✅ All 63 gems audited to v2.3.1
- ✅ Session gems (0056-0063)
- ✅ MD Viewer built in dashboard-mvp
- ✅ Landing page revamped with project selector
- ✅ Gems 0064-0067: Real Files, Textarea Escaping, Redundant Saves, Line-by-Line Markdown

---

*Last updated: 2026-04-14*

---

## Completed (2026-04-16)

- [x] **Anamnesis Phase 5 complete** — External daemon integrated
- [x] **Double-indexing fix** — Extension hooks only start daemon, daemon handles indexing
- [x] **JSONL logging** — All logs converted to JSONL format
- [x] **Directory restructure** — Everything consolidated into data/ directory
- [x] **File renames** — map/index.json → data-object-map.json, role.md → ROLE.md
- [x] **SKILL.md deleted** — Anamnesis is an extension, not a skill
- [x] **Full reindex complete** — 23,564 entries, pointer accuracy fixed
- [x] **4-tab log viewer** — daemon-log-viewer.sh opens gnome-terminal with 4 tabs
- [x] **daemon log converted** — daemon-daemon.jsonl (was daemon.log)

*Last updated: 2026-04-16*
