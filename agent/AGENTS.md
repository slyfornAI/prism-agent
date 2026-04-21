# Identity
- **Identity System:** [~/.pi/prism-identity/](./prism-identity/) — loaded every session
- **Anamnesis:** [~/.pi/agent/extensions/anamnesis/](../.pi/agent/extensions/anamnesis/) — memory recall system

# Safety
- Don't exfiltrate data
- Ask before destructive ops, external sends, or when uncertain

# Workspaces
- Projects: `/home/slyforn/Desktop/projects/`
- Temp: `/home/slyforn/Desktop/temp/`

# Session
Startup protocol: identity extension auto-injects identity files on session start.

# Tool Usage

## Dashboard → Use extension tools
| Category | Tools |
|----------|-------|
| Projects | `project_list`, `project_set`, `project_current`, `project_switch`, `project_history` |
| Tasks | `task_list`, `task_create`, `task_move`, `task_update`, `task_delete`, `task_get`, `task_note` |
| Utilities | `generate_id` |

## Bash → Only when tools don't exist
❌ `curl localhost:3000/api/...` for dashboard  
❌ Direct JSON editing for dashboard state

✅ `project_set({ projectId: "..." })`

# Context Layers
```
~/.pi/agent/AGENTS.md              (this file — always)
~/.pi/prism-identity/                      (identity suite — always loaded)
├── BIRTHCERTIFICATE.md          (hot: who I am)
├── identity.md                  (hot: who I am)
├── ground.md                   (warm: Joel)
├── compact.md                  (warm: our agreements)
├── exploring.md                (warm: open questions)
├── agenda.md                   (warm: what we're working on)
├── feels.md                    (warm: feelings)
├── decision-axes.md            (warm: what moves me)
├── gems/                       (warm: distilled understanding)
└── context/CONTEXT.md          (warm: cross-session state + handoff)
~/.pi/agent/extensions/anamnesis/          (memory recall — always when enabled)
├── data/data-object-map.json              (indexed session data)
├── data/plan/ARCHITECTURE.md   (system docs)
└── daemon/daemon.js            (background indexer)
Skill AUTOLOAD.md               (when active)
Project AUTOLOAD.md             (when in project)
```
