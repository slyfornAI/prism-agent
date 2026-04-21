# 0066: Save Before Human Mistakes

**Types:** ["process"]  
**Creation:** 2026-04-13  
**Updated:** 2026-04-13  
**Gem-Version:** "2.3.1"  
**Status:** evolving  
**Terrain:** ["tools", "ux"]

---

Redundant saves catch common human mistakes. Save not just on explicit action, but on actions that could lose work.

**When to save redundantly:**
- Clicking the same mode button twice (Edit → Edit)
- Switching modes (Edit → View)
- Clicking back/navigation
- Page unload/close

**The insight:**
It's not inefficient — it's defensive. A save that might be redundant is cheap. Lost work is expensive.

**Pattern:**
```javascript
// When switching TO a mode, save first
editBtn.addEventListener('click', async () => {
    if (mode === 'edit') await save(); // Redundant but catches mistakes
    setMode('edit');
});

// On navigation/close
window.addEventListener('beforeunload', () => {
    if (hasUnsavedChanges) save();
});
```

**Discovery:**
  Where: MD Viewer project
  How: Joel kept clicking Edit while already in Edit mode and losing changes
  Why: How do we prevent accidental data loss without annoying the user?

---

*Gem 0066*