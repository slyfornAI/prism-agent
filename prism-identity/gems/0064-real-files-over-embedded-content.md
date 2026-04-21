# 0064: Real Files Over Embedded Content

**Types:** ["recognition", "process"]  
**Creation:** 2026-04-13  
**Updated:** 2026-04-13  
**Gem-Version:** "2.3.1"  
**Status:** evolving  
**Terrain:** ["tools", "architecture"]

---

When data needs to be human-editable or version-controlled, use real files on disk rather than embedding content in JSON/DB.

**Problem this solves:**
- JSON-escaping content (`&` → `&amp;`) accumulates across save/load cycles
- Base64 encoding bloats storage and breaks human readability
- Real files can be edited anywhere, diffed, and version-controlled

**When to use:**
- Content is primarily human-created
- Files might exceed ~50 entries
- Need external editing capability

**When NOT to use:**
- Very small, machine-generated data (user preferences, counters)
- Binary data (images, blobs)
- Data that needs complex queries

**Pattern:**
```
data/
  metadata.json      # IDs, names, refs, timestamps
  files/             # Actual content files
    file1.md
    file2.txt
```

**Discovery:**
  Where: MD Viewer project
  How: JSON storage broke URLs with & characters; migrating to real files fixed it
  Why: How do we store markdown content without escaping hell?

---

*Gem 0064*