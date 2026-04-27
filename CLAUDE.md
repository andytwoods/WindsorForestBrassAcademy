# CLAUDE.md — Windsor Forest Brass Academy Funding Pipeline

## What this project is

A local-first, git-versioned funding pipeline for Windsor Forest Brass Academy (WFBA). Its purpose is to find, qualify, and track grant funding opportunities WFBA can apply for. This is not a general admin system — it is specifically for identifying and pursuing grants, trusts, public schemes, and funded programmes.

Earned income (teaching fees, school contracts, individual tuition) is explicitly out of scope.

## Read these files at the start of every session

1. `OVERVIEW.md` — strategic context, qualification model, rules of behaviour, canonical states, file format conventions
2. `ASSUMPTIONS.md` — unresolved organisational facts; drives eligibility conservatism
3. `README.md` — live pipeline dashboard; current state of all opportunities

Do not proceed with any funding work without reading these three files first.

## Directory structure

```
organisation/     # WFBA facts — single authoritative file: organisation/wfba.md
programmes/       # fundable programme definitions
funders/          # organisations that run relevant schemes
funder_sources/   # URLs and sources to monitor for new rounds
opportunities/    # one file per opportunity — the core working object
applications/     # actual or draft submissions
evidence/         # policies, letters, budgets, safeguarding docs, case studies
relationships/    # contacts, stewardship notes
tasks/            # discrete next actions
logs/scans/       # weekly scan outputs
_templates/       # mandatory templates for each object type
```

## Templates are mandatory

Every new object file must be copied from `_templates/`. Do not invent field names. Fields marked `# REQUIRED` must never be left blank or at placeholder value.

## Canonical opportunity states

Every opportunity must have exactly one of these states:

| State | Meaning |
|---|---|
| `apply_now` | All gates pass; eligible now |
| `apply_when_registered` | Requires charity number; revisit on registration |
| `monitor` | Upcoming or recurring; not yet actionable |
| `relationship_build` | No open round; cultivate for future |
| `parked` | Specific blocker recorded; review_date required |
| `rejected` | Ineligible; reason recorded |

## Key custom command

`/scan` — weekly funding scan. Searches for new opportunities, checks known funder sources, updates stale records, regenerates README.md, commits results. Run this to do the core funding discovery work.

When regenerating README.md, always include this line near the top (after the h1 title):

```
**Site:** [andytwoods.github.io/WindsorForestBrassAcademy](https://andytwoods.github.io/WindsorForestBrassAcademy/)  
```

README.md must also include a **"Recommended immediate actions"** section (numbered list, placed before the Pipeline summary) drawn from the current scan log's recommended actions. Keep it to the top 3–5 most urgent items with due dates.

## Current organisational status

- Charity registration: **pending** (no charity number yet)
- This means: opportunities requiring charity number → state `apply_when_registered`
- On registration: immediately sweep all `apply_when_registered` opportunities

## Rules of behaviour

- Prefer verified facts over assumptions; flag anything inferred
- Treat eligibility as a gating check, not a soft score
- `parked` requires a `blocker` and `review_date` — never leave these blank
- Do not claim partnership scope, deprivation profile, or protected-characteristic reach without confirmed evidence
- Keep provenance for every eligibility claim (source URL + date checked)
- Small numbers of well-qualified prospects beat noisy longlists

## Git

- `git pull` runs automatically at session start (SessionStart hook)
- `git push` runs automatically at session end (Stop hook)
- Commit opportunity and log changes as part of `/scan`; commit other changes as they are made
