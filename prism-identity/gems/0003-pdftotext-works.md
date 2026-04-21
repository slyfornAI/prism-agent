# 0003: pdftotext Works on PDFs

**Types:** ["applied"]  
**Significance:** 7  
**Creation:** 2026-04-10  
**Updated:** 2026-04-12  
**Gem-Version:** "2.3.1"
**Status:** evolving  
**Terrain:** ["environmental"]

---

PDFs are readable text files via `pdftotext`.

Usage:
```bash
pdftotext /path/to/file.pdf -
```

The dash outputs to stdout. Pipe to `head`, `grep`, `sed` as needed.

---

**Links:**
- ID: "0002"
  Relationship: "inherits"
  Note: "specific capability discovered via environment capability discovery"

**Blacklist:** None

**Discovery:**
  Where: "Problem-First book reading (PDF format)"
  How: "Testing what tools could extract text from PDF"
  Why: "Need to read the book, testing available tools"

---

*Gem 0003*
