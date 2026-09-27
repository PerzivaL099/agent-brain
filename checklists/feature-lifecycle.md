# Feature Lifecycle Checklist

> **Purpose**: Guide a feature from initial idea to verified production deployment. This checklist ensures every feature is properly scoped, planned, implemented, tested, reviewed, and documented before being considered complete.
>
> **When to use**: For every new feature or significant capability being added to a project.
>
> **Lifecycle**: Ideation → GitHub Issue → Planning → Development → Tests → PR → Review → Merge → Deploy → Verify → Document

---

## Checklist Header (Fill in for each feature)

```
Feature Name: [Short descriptive name]
GitHub Issue: #[issue-number]
Branch Name:  feat/[issue-number]-[short-description]
PR Link:      https://github.com/[org]/[repo]/pull/[pr-number]
Author:       [Name or agent]
Sprint/Milestone: [Sprint name or milestone]
Started:      [YYYY-MM-DD]
Merged:       [YYYY-MM-DD]
Deployed:     [YYYY-MM-DD]
```

---

## Phase 1: Ideation & Scoping

> *Validate the idea before investing any implementation time.*

- [ ] **State the problem being solved** — Write one paragraph describing the user pain point or business need
- [ ] **Confirm this is not already covered** — Check existing issues, features, and codebase for duplicates
- [ ] **Identify the user(s) affected** — Who benefits from this feature? How many users? How often?
- [ ] **Define the scope boundary** — What is included? What is explicitly NOT included?
- [ ] **Confirm the feature aligns with current priorities** — Check the GitHub Projects board and current milestone
- [ ] **Identify dependencies** — Does this feature depend on other issues, external APIs, or infrastructure changes?
- [ ] **Estimate rough size** — Is this `size: s`, `size: m`, `size: l`, or `size: xl`? If `xl`, consider breaking it into sub-features
- [ ] **Get stakeholder sign-off on scope** (if the feature is large or has business impact)

---

## Phase 2: GitHub Issue Creation

> *The GitHub Issue is the authoritative record of this feature. Take the time to fill it out properly.*

- [ ] **Create a new GitHub Issue** using the feature request template
- [ ] **Write a clear, specific title** — Format: `[Feature] Short description of what it does`
  - ✅ Good: `[Feature] Allow users to export their data as CSV`
  - ❌ Bad: `CSV export`, `Add export thing`
- [ ] **Fill in all template sections**:
  - [ ] **Summary**: 1-3 sentence description of the feature
  - [ ] **Motivation / Business Value**: Why does this need to exist? What problem does it solve?
  - [ ] **User Story**: `As a [user type], I want [goal] so that [reason]`
  - [ ] **Acceptance Criteria**: Testable conditions using Gherkin or numbered list
  - [ ] **Out of Scope**: Explicitly state what this issue does NOT cover
  - [ ] **Dependencies**: Link to any blocking or related issues
  - [ ] **Design / Mockups**: Attach or link any UI mockups, wireframes, or design specs (if applicable)
- [ ] **Apply labels**:
  - [ ] `type: feature`
  - [ ] `priority: [critical/high/medium/low]`
  - [ ] `size: [xs/s/m/l/xl]`
  - [ ] `status: ready` (or `status: needs-design` if design work is pending)
- [ ] **Assign to the appropriate milestone**
- [ ] **Assign to self** (or the engineer who will implement it)
- [ ] **Note the issue number**: **#\_\_\_\_**

---

## Phase 3: Link to GitHub Project Board

- [ ] **Add the issue to the GitHub Project board**
- [ ] **Move to the correct column**:
  - `Ready` if implementation is starting now
  - `Backlog` if scheduled for a future sprint
- [ ] **Verify it appears in the correct milestone/iteration view**
- [ ] **Add any relevant sprint metadata** (story points, iteration assignment)

---

## Phase 4: Implementation Planning

> *Design the implementation approach before writing a single line of code.*

- [ ] **Review existing code** — Understand the current architecture and where this feature fits
- [ ] **Identify files/modules to create**:
  - List new files that need to be created
  - Note their purpose and what they should contain
- [ ] **Identify files/modules to modify**:
  - List existing files that need to change
  - Note what changes are needed and why
- [ ] **Design the public interface/API** (if adding new public functions, endpoints, or components):
  - Define function signatures / endpoint contracts before implementing
  - Review with stakeholders if the contract is externally visible
- [ ] **Identify edge cases and error conditions**:
  - What happens with invalid inputs?
  - What happens when a dependency is unavailable?
  - What are the boundary conditions?
- [ ] **Plan the test strategy**:
  - What unit tests are needed?
  - What integration tests are needed?
  - Is an end-to-end test required?
- [ ] **Identify security considerations**:
  - Does this feature process user input? → Input validation needed
  - Does this feature return user data? → Authorization checks needed
  - Does this feature touch credentials or secrets? → Secrets management needed
- [ ] **Document the implementation plan** — Add as a comment on the GitHub Issue (this creates a traceable record)
- [ ] **Estimate time** — Update the size label if the implementation plan reveals the feature is larger/smaller than expected

---

## Phase 5: Branch Creation

- [ ] **Ensure your local `main` is up to date**: `git pull origin main`
- [ ] **Create a feature branch from `main`**: `git checkout -b feat/[issue-number]-[short-description]`
  - Branch name examples:
    - `feat/42-csv-data-export`
    - `feat/107-dark-mode-toggle`
    - `feat/88-rate-limiting-middleware`
- [ ] **Verify you are on the correct branch**: `git branch --show-current`
- [ ] **Push the branch to remote immediately** (establishes tracking, allows collaborators to see the branch):
  `git push -u origin feat/[issue-number]-[short-description]`
- [ ] **Update the GitHub Issue status label** to `status: in-progress`
- [ ] **Move the issue on the Projects board** to `🔨 In Progress`

---

## Phase 6: Code Implementation

> *Write clean, well-structured code that you'd be proud to have reviewed by anyone.*

- [ ] **Follow the implementation plan** — Stick to the scope; if new work is discovered, create a new issue
- [ ] **Follow existing code patterns and conventions** — Consistency with the codebase is more important than personal style preference
- [ ] **Write self-documenting code** — Choose clear variable/function names; code should explain the "what"
- [ ] **Add comments for the "why"** — Comment on non-obvious decisions, workarounds, and complex logic
- [ ] **Handle errors explicitly** — Never silently swallow exceptions; log or propagate appropriately
- [ ] **Validate all inputs** — At the system boundary (API endpoints, form handlers, CLI args)
- [ ] **Avoid hardcoded values** — Use constants, configuration, or environment variables
- [ ] **No debug code** — Remove all `console.log`, `print`, `debugger`, `pdb.set_trace()`, etc.
- [ ] **Commit regularly** — Small, atomic commits as you complete logical sub-units
  - Each commit must follow Conventional Commits format
  - Each commit should leave the codebase in a working state (tests passing)
  - Example commit sequence:
    ```
    feat(exports): add CSV serialization utility
    feat(exports): add export endpoint to data controller  
    feat(exports): add authorization check on export endpoint
    ```

---

## Phase 7: Tests Written

> *Tests are not optional. A feature without tests is not done.*

- [ ] **Unit tests written** for all new business logic, utility functions, and pure functions
  - Test: happy path, edge cases, error cases
  - Mock all external dependencies (database, APIs, file system)
  - Use Arrange-Act-Assert (AAA) pattern
  - Aim for ≥80% line coverage on new code
- [ ] **Integration tests written** for component boundaries
  - Test: real interactions between components (API → service → database)
  - At minimum: test the "happy path" of each new API endpoint or interface
  - Test error handling at integration points (what happens when DB is down, API returns 500, etc.)
- [ ] **End-to-end test added** (if feature touches a critical user path)
  - E2E tests simulate a real user interacting with the full system
  - Cover the primary user journey for this feature
- [ ] **Regression tests added** for any bugs that were fixed as part of this feature
- [ ] **All new tests pass** locally: run the full test suite
- [ ] **No tests were broken** — The full test suite passes with the new code
- [ ] **Coverage report reviewed** — Coverage did not decrease significantly from before this feature
- [ ] **Test code quality** — Tests are readable, well-named, and follow the same quality standards as production code

---

## Phase 8: Pre-PR Self Review

> *Be your own first reviewer. Catch issues before asking someone else to look.*

- [ ] **Run the complete pre-merge-checklist.md** ← Go to that file and check every item
- [ ] **Do a full diff review**: `git diff main..HEAD`
  - Read every changed line as if you're reviewing someone else's code
  - Look for: logic errors, missed edge cases, hardcoded values, debug artifacts, security issues
- [ ] **Read the implementation against the acceptance criteria** — Does the code actually satisfy every criterion?
- [ ] **Verify error messages** are user-friendly (if any user-facing errors were added)
- [ ] **Verify log messages** are meaningful and at the right level (debug/info/warn/error)

---

## Phase 9: Pull Request Creation

- [ ] **Ensure branch is up to date with `main`**: `git fetch origin && git rebase origin/main`
- [ ] **Resolve any merge conflicts** — Never leave conflict markers in committed code
- [ ] **Squash WIP commits** (optional but recommended) — Combine "work in progress" commits into logical atomic commits
- [ ] **Open the Pull Request** on GitHub
- [ ] **PR Title** — Follows Conventional Commits format:
  - Format: `feat(scope): short description`
  - Example: `feat(exports): add CSV data export endpoint`
- [ ] **PR Body** — Use the PR template; fill out ALL sections:
  - [ ] Summary of changes
  - [ ] Motivation and context
  - [ ] How to test manually (step-by-step instructions)
  - [ ] Screenshots or screen recordings (for any UI changes)
  - [ ] Checklist (all items checked)
  - [ ] `Closes #[issue-number]` (links PR to issue — GitHub will auto-close the issue on merge)
- [ ] **Add labels** to the PR: `type: feature`, `size: [size]`
- [ ] **Request reviewers** — Assign at least one reviewer
- [ ] **Move the issue on the Projects board** to `👀 In Review`

---

## Phase 10: CI/CD Passes

- [ ] **All CI checks are green** — No failures allowed
  - [ ] Lint check passing
  - [ ] Format check passing
  - [ ] All tests passing
  - [ ] Build succeeds
  - [ ] Coverage threshold met
  - [ ] Security scan (if configured) passing
- [ ] **If CI fails**: Fix the issue, push new commits to the branch, wait for CI to re-run
- [ ] **No warnings escalated to errors** that weren't there before

---

## Phase 11: Code Review

- [ ] **Reviewer(s) have been assigned** and notified
- [ ] **All review comments addressed**:
  - Minor comments: Fixed in a follow-up commit on the branch
  - Major comments: Discussed and resolved (either fixed, or a counter-argument accepted)
  - Never dismiss review comments without addressing them — if you disagree, discuss in the PR thread
- [ ] **All reviewer threads are resolved**
- [ ] **At least one approval received**
- [ ] **No unresolved change requests remain**

---

## Phase 12: Merge & Close Issue

- [ ] **Final CI check is green** (re-run if the branch has been updated since last green run)
- [ ] **Merge the PR** using the project's configured merge strategy (squash, rebase, or merge commit)
  - Prefer squash merge for feature branches to maintain a clean main history
- [ ] **Verify the GitHub Issue is automatically closed** (if `Closes #N` was in the PR body)
  - If not auto-closed, manually close the issue and add a comment: "Closed by PR #[pr-number]"
- [ ] **Delete the feature branch** (GitHub can be configured to do this automatically)
- [ ] **Move the card to `✅ Done`** on the GitHub Projects board
- [ ] **Update the milestone progress** — Check if the milestone percentage looks correct

---

## Phase 13: Deploy

> *Run through the pre-deployment-checklist.md before deploying.*

- [ ] **Run pre-deployment-checklist.md** ← Go to that file and check every item
- [ ] **Deploy to staging first** — Verify in a staging/pre-production environment before production
- [ ] **Run smoke tests against staging** — Confirm the feature works in the deployed environment
- [ ] **Deploy to production** following the deployment runbook
- [ ] **Monitor deployment** — Watch error rates, latency, and logs during and immediately after deployment

---

## Phase 14: Verify in Production

- [ ] **Run smoke tests against production** — Hit the key endpoints/flows that were changed
- [ ] **Verify acceptance criteria are met in production** — Walk through each acceptance criterion against the live system
- [ ] **Monitor error rates** for 15-30 minutes post-deployment
- [ ] **Check application logs** for unexpected warnings or errors introduced by the feature
- [ ] **Confirm monitoring/alerting** covers the new feature (metrics/logs are appearing as expected)
- [ ] **User acceptance** — If applicable, notify the stakeholder who requested the feature and confirm they're satisfied

---

## Phase 15: Documentation

- [ ] **README updated** (if the feature changes how the project is used, set up, or configured)
- [ ] **API documentation updated** (if new endpoints were added or existing ones changed)
  - OpenAPI spec, GraphQL schema, or equivalent updated
- [ ] **Runbook updated** (if the feature adds operational complexity)
- [ ] **Internal wiki or Confluence updated** (if your team maintains external documentation)
- [ ] **In-code documentation** complete:
  - New public functions/methods have docstrings
  - New modules have module-level docstrings
- [ ] **Architecture documentation updated** (if the feature changes system architecture)
  - Update architecture diagram if new components were added
  - Add or update ADRs if a new significant decision was made

---

## Phase 16: Update CHANGELOG

- [ ] **Update `CHANGELOG.md`** following the Keep a Changelog format (https://keepachangelog.com/)
- [ ] **Add the entry under `## [Unreleased]`** (or the appropriate version section if releasing now):
  ```markdown
  ### Added
  - feat(exports): CSV data export endpoint for user account data (#42)
  ```
- [ ] **Categorize the change correctly**:
  - `Added` — New features
  - `Changed` — Changes to existing functionality
  - `Deprecated` — Features to be removed in a future version
  - `Removed` — Removed features
  - `Fixed` — Bug fixes
  - `Security` — Security fixes
- [ ] **Commit the CHANGELOG update** separately if it wasn't included in the feature PR:
  `docs(changelog): add CSV export feature entry for v[x.y.z]`

---

## Feature Complete ✅

When every phase above is checked, the feature is **done**. Not "mostly done." Not "done except for docs." Done.

> *"Done means: working in production, tested, documented, and not creating surprises for the next engineer."*

---

*Template version: 1.0 | Part of Agent SDLC Brain*
