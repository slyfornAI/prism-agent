# Session Recovery Protocol

## Overview

When Prism crashes or is interrupted, this protocol ensures orchestrators can resume work without loss of state.

## Recovery Flow

```
pi starts / resumes
    │
    ├── Check CONTEXT.md for recovery flag
    │       │
    │       └── No flag → Fresh start, load normal context
    │
    └── Recovery flag found
            │
            ├── Read resume-data path from flag
            │
            ├── Load orchestrator state
            │
            ├── Validate state integrity
            │
            └── Resume orchestrator from checkpoint
```

## Recovery Flag Format

Located in `~/.pi/CONTEXT.md` or AGENTS.md header:

```markdown
# resumed-from: unified-manager
# resume-data: /path/to/orchestrator-state.json
# resumed-at: 2026-03-24T12:00:00Z
```

Or in JSON format in `CONTEXT.md`:

```json
{
  "recovery": {
    "from": "unified-manager",
    "dataPath": "/path/to/orchestrator-state.json",
    "at": "2026-03-24T12:00:00Z"
  }
}
```

## State File Structure

Each orchestrator type has its own state file:

### Super-Orchestrator State

```json
{
  "version": "1.0",
  "type": "super-orchestrator",
  "state": "running",
  "checkpoint": {
    "activeProject": "dashboard-mvp",
    "completedProjects": ["issue-tracker"],
    "pendingProjects": ["dashboard-tools"],
    "crossProjectTasks": []
  },
  "lastUpdated": "2026-03-24T12:30:00Z",
  "checkpointId": "cp-001"
}
```

### Per-Project Orchestrator State

```json
{
  "version": "1.0",
  "type": "per-project-orchestrator",
  "project": "dashboard-mvp",
  "state": "suspended",
  "checkpoint": {
    "currentTask": "task-042",
    "tasksCompleted": ["task-001", "task-002", "task-003"],
    "tasksBlocked": ["task-015"],
    "tasksInProgress": ["task-042"],
    "workerState": {
      "workerId": "worker-1",
      "currentAction": "implementing feature",
      "sessionHistory": []
    },
    "reviewerState": {
      "pendingReviews": [],
      "activeReview": null
    }
  },
  "lastUpdated": "2026-03-24T12:30:00Z",
  "checkpointId": "cp-042"
}
```

## Checkpoint Triggers

Checkpoints are saved:

| Trigger | When |
|---------|------|
| Task completed | After task moves to Review or Done |
| Worker spawned | Worker session ID captured |
| Before orchestrator switch | When super-orchestrator switches projects |
| Periodic | Every N minutes during long operations |
| Signal received | SIGTERM, interrupt, or crash |

## Recovery Steps by Component

### 1. Prism (Main Agent)

```javascript
// On startup
const context = loadContext();
if (context.recovery) {
  const { from, dataPath } = context.recovery;
  const orchestratorState = loadState(dataPath);
  await resumeOrchestrator(orchestratorState);
}
```

### 2. Super-Orchestrator

```javascript
async function resumeOrchestrator(state) {
  // 1. Validate state
  validateState(state);
  
  // 2. Resume or restart per-project orchestrators
  for (const project of state.projects) {
    if (project.state === 'suspended') {
      await resumePerProjectOrchestrator(project);
    }
  }
  
  // 3. Continue cross-project coordination
  continueCrossProjectTasks(state.crossProjectTasks);
}
```

### 3. Per-Project Orchestrator

```javascript
async function resumePerProjectOrchestrator(projectState) {
  // 1. Resume worker if was running
  if (projectState.workerState?.sessionId) {
    await reconnectToWorker(projectState.workerState.sessionId);
  }
  
  // 2. Resume task if was in progress
  if (projectState.currentTask) {
    const task = getTask(projectState.currentTask);
    if (task.column === 'In Progress') {
      // Task was executing - check if worker session is alive
      // If not, move back to Backlog or retry
    }
  }
  
  // 3. Continue from checkpoint
  continueTaskExecution(projectState.checkpoint);
}
```

## Validation

On recovery, state is validated:

```javascript
function validateState(state) {
  const errors = [];
  
  // Version check
  if (!state.version) {
    errors.push('Missing version');
  }
  
  // Type check
  if (!['super-orchestrator', 'per-project-orchestrator'].includes(state.type)) {
    errors.push('Invalid orchestrator type');
  }
  
  // Timestamp check (state not too old)
  const maxAge = 24 * 60 * 60 * 1000; // 24 hours
  if (Date.now() - new Date(state.lastUpdated).getTime() > maxAge) {
    errors.push('State too old, manual review required');
  }
  
  // Checkpoint integrity
  if (!state.checkpoint || !state.checkpointId) {
    errors.push('Missing checkpoint data');
  }
  
  if (errors.length > 0) {
    throw new RecoveryError(errors);
  }
}
```

## Recovery Scenarios

### Scenario 1: Worker Crashed Mid-Task

```
Worker was implementing task-042
Worker crashed
State saved: task-042 = In Progress
Recovery: Move task-042 to Backlog
          Notify orchestrator
          Orchestrator decides: retry or reassign
```

### Scenario 2: Per-Project Orchestrator Interrupted

```
Orchestrator was switching from dashboard-mvp to issue-tracker
Interrupted mid-switch
State saved: dashboard-mvp = suspended, issue-tracker = pending
Recovery: Resume dashboard-mvp from checkpoint
          Complete any pending work
          Then switch to issue-tracker
```

### Scenario 3: Super-Orchestrator Fully Crashed

```
Super-orchestrator was managing 3 project orchestrators
All state saved
Recovery: Load super-orchestrator state
          Validate all project states
          Resume each project orchestrator sequentially
```

### Scenario 4: Long-Dormant Recovery

```
Session crashed, not resumed for 48 hours
State is stale
Recovery: Flag as requiring manual review
          Notify user
          User decides: resume or start fresh
```

## Recovery State Storage

| State | Location |
|-------|----------|
| Super-orchestrator | `~/.pi/agent/skills/unified-manager/.state/master-state.json` |
| Per-project orchestrator | `PROJECT/.state/orchestrator-state.json` |
| Worker sessions | Managed by pi subagent system |
| CONTEXT.md | `~/.pi/CONTEXT.md` |

## Error Handling

| Error | Action |
|-------|--------|
| State file missing | Start fresh, log warning |
| State file corrupt | Start fresh, log error, preserve for debugging |
| State too old | Flag for manual review |
| Worker session dead | Move task to Backlog, notify |
| Checkpoint invalid | Start fresh from last valid state |

## Clearing Recovery State

After successful completion:

```bash
# Remove recovery flag
clearRecoveryFlag()

# Or on task completion
if (orchestrator.state === 'completed') {
  clearRecoveryFlag();
  archiveState(state);
}
```

## Related Documents

- [SUPER-ORCHESTRATOR.md](./SUPER-ORCHESTRATOR.md) - Architecture
- [INTEGRATION.md](./INTEGRATION.md) - System integration
- [AGENTS.md](./AGENTS.md) - Agent configuration
