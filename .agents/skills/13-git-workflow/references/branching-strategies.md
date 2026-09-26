# Branching Strategies Deep-Dive

## 1. GitHub Flow (Recommended)
**Philosophy**: The `main` branch is always deployable. Branches are short-lived.
**Best for**: Continuous deployment, SaaS, agile teams.
**Process**:
- Branch from `main`.
- Commit changes.
- Open PR, get review.
- Merge to `main`.
- Deploy immediately.

## 2. Git Flow
**Philosophy**: Strict branch hierarchy (`master`, `develop`, `feature`, `release`, `hotfix`).
**Best for**: Versioned software with explicit release cycles (e.g., downloadable desktop apps, mobile apps).
**Process**:
- `develop` is the integration branch.
- Features branch off `develop`.
- Releases branch off `develop`, get finalized, then merge into `master` (and back to `develop`).
- Hotfixes branch off `master`, fix the issue, and merge back to `master` and `develop`.
**Trade-offs**: Complex, can lead to merge hell if branches live too long. Overkill for web apps.

## 3. Trunk-Based Development
**Philosophy**: All developers commit to `main` (the trunk) multiple times a day.
**Best for**: High-performing, senior CI/CD teams with robust feature flags.
**Process**:
- No long-lived branches (branches last < 1 day).
- Code is hidden behind feature flags if incomplete.
- Heavy reliance on automated testing.

## When to Migrate
- **GitHub Flow → Trunk-Based**: When your CI/CD is fully automated, testing is bulletproof, and the team is highly disciplined in using feature flags.
- **GitHub Flow → Git Flow**: If your product transitions from a web service to a versioned on-premise application requiring maintenance of multiple older versions.
