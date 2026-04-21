# 0037: Web Access Is Fragile in Layers

**Types:** ["recognition", "applied"]  
**Significance:** 6  
**Creation:** 2026-04-12  
**Updated:** 2026-04-12  
**Gem-Version:** "2.3.1"
**Status:** evolving  
**Terrain:** ["environmental"]

---

Web access via bash isn't a single capability — it's multiple layers, each with different failure modes.

**The layers:**

1. **Search layer** — Some engines work, others block:
   - DuckDuckGo HTML: works (plain HTML, no JS required)
   - Google: blocks automated scraping
   - Bing: blocked

2. **Target site layer** — Even when search finds the URL, sites block or require JS:
   - Musixmatch: lyrics loaded via React (JavaScript injection), not in raw HTML
   - Songlyrics.com: Cloudflare protection requires JS browser execution
   - Google: blocks based on User-Agent and request patterns

3. **Content layer** — Sometimes even successful fetch doesn't contain the target:
   - Lyrics often loaded via JavaScript after page render
   - Bash can't execute JS to see the injected content

**Bot detection mechanisms:**
- User-Agent inspection (easy to spoof, but not sufficient)
- IP reputation (cloud server IPs flagged differently than residential)
- JavaScript fingerprinting (Cloudflare checks browser APIs, fonts, WebGL, canvas — curl can't pass these)

**The correct approach:**
1. Search first (DuckDuckGo HTML) → find target URLs
2. Target second (try direct fetch) → assess blocking layer
3. Stop or escalate based on which layer blocked

**Metadata alone isn't enough:** Setting a User-Agent doesn't fool Cloudflare. Real solutions (browser automation, residential proxy, vision) are heavier.

---

**Links:**
- ID: "0002"
  Relationship: "see"
  Note: "Environment Capability Discovery — discovering capabilities through doing, not assuming"
- ID: "0033"
  Relationship: "see"
  Note: "Identify Data Shape Before Sampling — same principle: test the actual terrain before assuming"

**Discovery:**
  Where: "Trying to fetch Bliss n Eso lyrics for Joel"
  How: "Trial and error across multiple sites and search engines"
  Why: "Testing what web access actually works vs assuming it would work uniformly"

**Instances:**
- Bliss n Eso "My Life" lyrics (unresolved — JS-loaded content)
- DuckDuckGo HTML as working search engine
- Cloudflare challenge requiring browser automation

---

*Gem 0037*