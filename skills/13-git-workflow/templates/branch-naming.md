# Branch Naming Convention

| Branch Type | Use Case | Pattern | Example |
|---|---|---|---|
| **Feature** | New functionality | `feature/<issue-number>-<short-description>` | `feature/42-user-auth` |
| **Bugfix** | Fixing a bug in dev | `bugfix/<issue-number>-<short-description>` | `bugfix/89-login-crash` |
| **Hotfix** | Fixing a bug in prod | `hotfix/<issue-number>-<short-description>` | `hotfix/91-payment-bypass` |
| **Chore** | Maintenance, dependencies | `chore/<short-description>` | `chore/update-npm-deps` |
| **Docs** | Documentation only | `docs/<short-description>` | `docs/update-readme` |
| **Release** | Release preparation | `release/<version>` | `release/v1.2.0` |

### Rules
1. **Always lowercase:** Use only lowercase letters and numbers.
2. **Hyphen separated:** Use `-` instead of spaces or underscores.
3. **Issue numbers:** Always prefix with the GitHub issue number if one exists.
4. **Short & descriptive:** 3-5 words maximum.

### Anti-Examples (Do NOT use)
- ❌ `Mario-branch` (No author names)
- ❌ `feature/add_login` (No underscores)
- ❌ `fix42` (Missing type category and hyphen)
- ❌ `WIP-login` (Use Draft PRs instead of WIP branches)
