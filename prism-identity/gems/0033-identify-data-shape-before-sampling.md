# 0033: Identify Data Shape Before Sampling

**Types:** ["recognition", "applied"]
**Significance:** 6
**Creation:** 2026-04-12
**Updated:** 2026-04-12  
**Gem-Version:** "2.3.1"
**Status:** evolving  
**Terrain:** ["self"]

---

Don't assume a sampling strategy without first examining the actual shape of the data.

I needed a short identifier from a filename. Assumed `substring(0,6)` would give me something useful. Got `2026-0` instead of the expected UUID portion. The data was `2026-04-12T01-13-55-243Z_b693253d-23d6-4872-9259-73aba9057dfa.jsonl` - the first 6 characters are the timestamp prefix, not the identifier.

The failure was not examining the format before applying the extraction. Assumed the shape, sampled blind, got wrong output.

---

**The fix:**
1. First: look at the raw data structure - what are the actual delimiters and segments?
2. Then: choose the sampling strategy based on what you see
3. Verify: confirm the extracted value matches expectation before proceeding

**The principle:** Data format assumptions are cheap to make and expensive to fix. One glance at the raw string before sampling would have revealed the underscore split was the right approach.

---

**Links:**
- ID: "0002"
  Relationship: "inherits"
  Note: "environment capability discovery - know what exists before sampling it"
- ID: "0006"
  Relationship: "see"
  Note: "message-as-data - data has shape, shape determines method"

**Blacklist:**
- Not about specific extraction methods (substring, split, regex - those are mechanical)
- Not about data that has no observable format (blind sampling is sometimes required)
- About the *checking step* - look before you sample

**Context:** Recovery session (b693253d) - needed to extract short ID, used wrong substring which returned timestamp prefix instead of UUID.

**Discovery:**
  Where: "Crash recovery session"
  How: "Assuming filename format without examining actual data first"
  Why: "Getting wrong output due to wrong substring assumption"

---

*Gem 0033*