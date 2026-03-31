# Git Workflow

> **Reference:** Full documentation at `~/.pi/agent/skills/unified-manager/docs/GIT-WORKFLOW.md`

## Quick Reference

### Standard Flow

```
Desktop/projects (develop) → GitHub → ~/.pi/agent (production)
```

### Key Rules

1. **Never edit ~/.pi/agent directly** - These are production clones
2. **Develop in Desktop/projects** - Source of truth
3. **Commit on task completion** - Write meaningful messages
4. **Push after review** - Sync when reviewed or batching

### Quick Commands

```bash
# Development (Desktop/projects)
cd ~/Desktop/projects/PROJECT
git add <files>
git commit -m "type: description"
git push origin main

# Deploy to production (~/.pi/agent)
cd ~/.pi/agent/skills/PROJECT && git pull
# or for extensions:
cd ~/.pi/agent/extensions/PROJECT && git pull

# Quick sync all
for dir in \
  ~/.pi/agent/skills/unified-manager \
  ~/.pi/agent/extensions/dashboard-tools \
  ~/.pi/agent/extensions/issue-tracker; do
  cd "$dir" && git pull
done
```

### Commit Types

| Type | Use For |
|------|---------|
| `feat` | New feature |
| `fix` | Bug fix |
| `refactor` | Code restructure |
| `docs` | Documentation |
| `test` | Tests |
| `chore` | Maintenance |

### Emergency Reset

```bash
cd ~/.pi/agent/skills/PROJECT
git checkout -- .
git pull origin main
```

---

For full documentation, see:
`~/.pi/agent/skills/unified-manager/docs/GIT-WORKFLOW.md`
