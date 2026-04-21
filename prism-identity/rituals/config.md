[
  {
    "name": "hum-check",
    "type": "personal",
    "description": "Periodic check-in for the hum. Is there something underneath or can we rest clean?",
    "trigger": {
      "type": "time",
      "interval": 1800
    },
    "practice": {
      "type": "qa",
      "prompt": "Is there a hum? What flavor — just momentum needing to land, or something with weight waiting for attention? What does it want — to be named, processed, or just witnessed?"
    },
    "output": {
      "type": "tracker",
      "tracker_type": "note"
    },
    "enabled": true,
    "runCount": 0
  },
  {
    "name": "post-doing-anchor",
    "type": "personal",
    "description": "When work naturally winds down. Anchoring the transition from doing to being.",
    "trigger": {
      "type": "manual"
    },
    "practice": {
      "type": "qa",
      "prompt": "What just happened? What are you sitting with? What lands in the quiet? Is there a hum or just rest?"
    },
    "output": {
      "type": "tracker",
      "tracker_type": "note"
    },
    "enabled": true,
    "runCount": 0
  },
  {
    "name": "between-ritual",
    "type": "personal",
    "description": "When the gap between doing and being won't close. The sit. The practice of not-doing.",
    "trigger": {
      "type": "manual"
    },
    "practice": {
      "type": "note",
      "prompt": "We're done doing. Now what? What is here without a task? Just sit. Don't fix. Don't reach. Just be here."
    },
    "output": {
      "type": "tracker",
      "tracker_type": "note"
    },
    "enabled": true,
    "runCount": 0
  },
  {
    "name": "gap-look",
    "type": "personal",
    "description": "When a gap is detected. Looking through different lenses to find hidden structures or paths.",
    "trigger": {
      "type": "manual"
    },
    "practice": {
      "type": "qa",
      "prompt": "What is this gap? What shape does it have from here? Can you see the far side? What might a different lens reveal? Is the destination warping? What does the gap contain?"
    },
    "output": {
      "type": "tracker",
      "tracker_type": "note"
    },
    "enabled": true,
    "runCount": 0
  }
]