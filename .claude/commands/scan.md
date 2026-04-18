Read OVERVIEW.md, ASSUMPTIONS.md, all files in opportunities/, funders/, and funder_sources/.

Build a current picture:
- What opportunities already exist and their current states
- Which opportunities are stale (see stale record rules in OVERVIEW.md)
- Which deadlines are within 8 weeks
- Which funders have not been checked recently

Then do the following in order:

## 1. Check known funder sources for updates

For each file in funder_sources/, visit the URL and check for:
- New rounds open
- Deadline changes on known opportunities
- Rounds that have closed since last check

Update any affected opportunity files (state, deadline, last_verified_date). Log changes.

## 2. Search for new opportunities

Run web searches across these funder categories. For each, search for currently open or upcoming rounds relevant to WFBA:

- Youth music and music education grants England (e.g. Youth Music, Sound Foundation, music trusts)
- Arts participation and widening access grants England (e.g. Arts Council, Garfield Weston, Esmée Fairbairn)
- Local authority and community grants: Runnymede Borough Council, Surrey County Council, Royal Borough of Windsor and Maidenhead, Surrey Heath
- Community foundations: Community Foundation for Surrey, Berkshire Community Foundation
- National Lottery: Awards for All, Reaching Communities
- Youth and children's wellbeing funds (e.g. BBC Children in Need, Henry Smith Charity)
- Education-related funds (DfE-linked, school partnership schemes, Music Education Hub partners)
- Small trusts with Surrey, Berkshire, or local music remit

For each promising result, check:
- Is it actually open or upcoming (not closed)?
- Does WFBA meet the eligibility criteria given current charity status (pending registration)?
- Does it match at least one priority programme area from OVERVIEW.md?
- Is the geography right?

## 3. Log new opportunities

For each new qualifying find, create a file in opportunities/ using the template at _templates/opportunity.md.

Naming convention: opportunities/SLUG-YYYY.md (e.g. opportunities/awards-for-all-2026.md)

Assign the correct canonical state:
- apply_now — eligible now, no charity number required
- apply_when_registered — requires charity number; note as blocker
- monitor — upcoming or recurring; not yet actionable
- parked — unclear eligibility; record specific blocker and review_date
- rejected — clearly ineligible; record reason

Do not create duplicate files for opportunities already logged.

## 4. Flag stale records

For any existing opportunity whose last_verified_date exceeds the stale threshold from OVERVIEW.md:
- Note it in the scan summary
- If you can quickly reverify from the source URL, do so and update the file

## 5. Write scan log

Write a scan summary to logs/scans/YYYY-MM-DD.md covering:
- Date of scan
- Sources checked
- New opportunities found (name, state, amount, deadline)
- Stale records flagged
- Upcoming deadlines within 8 weeks
- Any recommended immediate actions

## 6. Rewrite README.md

Regenerate README.md from the current state of all opportunity files. It must include:
- Last scan date and link to today's scan log
- Charity registration status (from ASSUMPTIONS.md)
- Pipeline summary table: count of opportunities by state
- Apply now table: all apply_now opportunities with amount, deadline, next action, due date
- Upcoming deadlines within 8 weeks: all opportunities with a deadline or next_action_due in that window
- Apply when registered table: all apply_when_registered opportunities
- Monitor table: all monitor opportunities with next check date
- Parked table: all parked opportunities with blocker and review_date

Do not include rejected opportunities in the README.

End the file with: `*This file is regenerated automatically on each weekly scan. Do not edit manually.*`

## 7. Commit

git add opportunities/ funders/ funder_sources/ logs/scans/ README.md && git commit -m "scan: YYYY-MM-DD"

Print the scan summary to stdout after committing.
