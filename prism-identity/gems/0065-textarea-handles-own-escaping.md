# 0065: Textarea Handles Own Escaping

**Types:** ["recognition", "process"]  
**Creation:** 2026-04-13  
**Updated:** 2026-04-13  
**Gem-Version:** "2.3.1"  
**Status:** evolving  
**Terrain:** ["tools", "frontend"]

---

Textareas render raw text by default. Don't apply HTML escaping to textarea content.

**Problem this solves:**
- Calling `escapeHtml()` on textarea value double-escapes content
- `&` in textarea becomes `&amp;` on first save, `&amp;amp;` on second
- Unnecessary complexity for a problem that doesn't exist

**The pattern:**
- `<textarea>` — renders raw text, handles escaping internally
- `<div v-html>` — renders HTML, needs escaped content
- Mixing them breaks things

**When escaping IS needed:**
- Putting content into innerHTML
- Building HTML strings dynamically
- URLs in link href attributes

**Discovery:**
  Where: MD Viewer project
  How: Debugging broken URLs; found that escapeHtml() was being applied to textarea content before saving
  Why: Where should HTML escaping happen and where should it not?

---

*Gem 0065*