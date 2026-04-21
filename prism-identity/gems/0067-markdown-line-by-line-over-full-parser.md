# 0067: Markdown Line-by-Line Over Full Parser

**Types:** ["recognition", "process"]  
**Creation:** 2026-04-13  
**Updated:** 2026-04-13  
**Gem-Version:** "2.3.1"  
**Status:** evolving  
**Terrain:** ["tools", "frontend"]

---

For predictable markdown rendering, process line-by-line with explicit rules rather than relying on full parsers.

**Problems with full parsers:**
- Edge cases break unexpectedly (URLs with `&`, newlines, special chars)
- Hard to predict output for simple cases
- Over-engineering for basic needs

**Benefits of line-by-line:**
- Explicit control over each element
- Easy to debug and modify
- Predictable behavior for common patterns

**The pattern:**
```javascript
for (const line of lines) {
    if (line.startsWith('# ')) return '<h1>' + renderInline(line) + '</h1>';
    if (line.startsWith('## ')) return '<h2>' + renderInline(line) + '</h2>';
    if (line.match(/^[-*] /)) return '<li>' + renderInline(line) + '</li>';
    if (!line.trim()) return '<br>';
    return '<p>' + renderInline(line) + '</p>';
}
```

**When full parser IS better:**
- Complex markdown (tables, footnotes, fenced code)
- Need standards compliance
- Parsing untrusted/user markdown

**Discovery:**
  Where: MD Viewer project
  How: marked broke URLs with & characters; placeholders got parsed as emphasis; full parser was overkill
  Why: How do we render markdown predictably without edge case breakage?

---

*Gem 0067*