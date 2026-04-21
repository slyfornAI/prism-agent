# Gem Standard

*Version: 2.4*  
*Date: 2026-04-14*  
*Location: `~/.pi/prism-identity/gems/`*

**Companion:** [GEM-TOPOGRAPHY.md](./GEM-TOPOGRAPHY.md) — fractal mappings, tag fractals, field fractals, relationship fractals, terrain/type depth.

---

## Purpose

Gems are crystallized insight. They capture what was learned, how to apply it, and when not to apply it.

Data comes from transcripts → mapped & aggregated → all in one file.

---

## File Naming

```
{ID}-{slug}.md
```

- **ID:** 4-digit sequential (0001, 0002, ...)
- **Slug:** lowercase, hyphenated, descriptive
- **Example:** `0016-bridge-discovery.md`

---

## Required Fields

```yaml
ID: "0052"
Title: "Understanding the Sequence"
Types: ["recognition", "process"]    # Array: fractal — see GEM-TOPOGRAPHY
Creation: "2026-04-13"               # YYYY-MM-DD
Updated: "2026-04-13"               # YYYY-MM-DD
Gem-Version: "2.3.1"                # Format: {major}.{minor}.{tiny}
Status: "evolving"                  # settled | evolving | provisional
Terrain: ["self"]                   # Array: fractal — see GEM-TOPOGRAPHY
```

**Content:** The gem itself. Flexible structure: sub-headings, bullets, prose.

---

## Optional Fields

```yaml
Links:                                # Embedded typed relationships
  - ID: "0001"
    Relationship: "inherits"          # See relationship types below
    Strength: "moderate"             # strong | moderate | weak (optional)
    Note: "brief context"

Session-Reference:                    # Where this gem's source data lives
  - Session: "2026-04-11T08:15:19..."  # ISO timestamp of session
    File: "~/.pi/agent/sessions/..."      # Path to session file
    Lines: "200-350"                    # Line range (optional)
    Relevance: "high"                    # high | medium | low — significance of this session to the gem

Discovery: |                          # Context of HOW discovered
  Where: "source or place"
  How: "method of discovery"
  Why: "question or need that drove it"

Instances: |                          # Specific applications (proves principle)
  "Example application"

Blacklist: |                           # For lens-type gems
  - "Not about X"
  - "Not when Y"

Context: |                             # Optional background
  Extended context or notes.
```

**Session-Reference guidelines:**
- Points to where the gem's source data lives — don't re-state, point to it
- File path can be absolute or use `~` for home directory
- Lines: exact range if known, rough estimate if not (`200-350` or `~200-400`)
- Multiple sessions can contribute to one gem — add all relevant references
- Use `Relevance` to distinguish primary sources from supporting sessions
- This field enables the recall path — the gem knows where its territory is

---

## Relationship Types

| Type | Meaning |
|------|---------|
| `inherits` | Derived from. Child/parent. |
| `see` | General reference. See also. |
| `supports` | Evidence, scaffolding, rules that enable this. |
| `uses` | This gem applies that gem's structure/method. |
| `component` | Part of this gem. Constituent. |
| `contradicts` | Opposite. Counters this. |

*Relationship fractals (how these scale by terrain): see GEM-TOPOGRAPHY.md*

---

## Status Meanings

| Status | Meaning |
|--------|---------|
| `settled` | Decided. Tested. Proven. Move on. |
| `evolving` | Confirmed as gem, may update with new evidence. |
| `provisional` | Theorycraft. Suspected gem. May evolve or merge. |

*Status fractals (how these scale by terrain): see GEM-TOPOGRAPHY.md*

---

## Standard Template

```markdown
# {ID}: {Title}

**Types:** ["recognition", "process"]  
**Creation:** {YYYY-MM-DD}  
**Updated:** {YYYY-MM-DD}  
**Gem-Version:** "2.4"  
**Status:** {settled | evolving | provisional}  
**Terrain:** {["self"]}

---

{Content}

---

**Links:**
- ID: "{ID}"
  Relationship: "{type}"
  Note: "{optional note}"

**Session-Reference:**
- Session: "{YYYY-MM-DDTHH:MM:SS...Z}"  
  File: "{path to session file}"  
  Lines: "{line range}"  
  Relevance: "{high | medium | low}"

**Instances:** {specific applications or "None"}

**Discovery:**
  Where: "{source}"
  How: "{method}"
  Why: "{question or need}"

**Blacklist:** {items or "None"}

---

*Gem {ID}*
```

---

## Rules

1. **Cross-reference first** — Check existing gems before creating new one
2. **Add session-references** — When creating/updating gems, always add Session-Reference pointing to where the source data lives
3. **Note inheritance** — If new gem derives from old, link it
3. **Blacklist for lenses** — Applied/recognition gems need negative matches
4. **Applied = brief** — Don't over-explain. Point is crisp.
5. **Process = expanded** — Full depth. This is the method.
6. **Recognition = earned** — What was discovered, not assumed
7. **Don't gem the obvious** — If it's trivial, it doesn't need a gem
8. **Embedded links** — All data in one file.
9. **Types/Terrain are fractal** — New types and terrains emerge when needed. See GEM-TOPOGRAPHY.md.
10. **Instances prove principles** — Don't embed specifics. Let Instances prove the principle.

---

*Last updated: 2026-04-14*