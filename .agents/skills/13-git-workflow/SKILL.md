---
name: git-workflow
description: |-
  Use this skill for all Git operations — creating branches, managing worktrees, creating pull requests, handling merges, and maintaining a clean Git history. Activates when starting work on a ticket, creating a PR, resolving conflicts, or when the user asks about Git workflow, branching strategy, or worktrees. Follows GitHub Flow as the primary branching strategy with git worktrees for parallel development.
---

# Git Workflow

As an AI agent, you must rigorously follow the GitHub Flow branching strategy and maintain a clean, traceable Git history using Conventional Commits. Use git worktrees for parallel task management.

## 1. Primary Strategy: GitHub Flow
GitHub Flow is a simple, continuous-delivery friendly strategy:
- The `main` branch is **always deployable**.
- All new work (features, bugfixes) occurs on **feature branches** branched off `main`.
- Process: Branch → Commit → Open PR → Review → Merge → Deploy.

## 2. Branch Naming Conventions
Always format branches exactly as follows:
- Feature: `feature/<issue-number>-<short-description>`
- Bugfix: `bugfix/<issue-number>-<short-description>`
- Hotfix: `hotfix/<issue-number>-<short-description>`
- Chore: `chore/<short-description>` (if no issue linked)
- Release: `release/<version>` (if doing explicit versioning)
- Docs: `docs/<short-description>`

*Ensure description is lowercase, hyphen-separated.*

## 3. Git Worktrees
Use `git worktree` when handling multiple tasks simultaneously (e.g., stopping feature work to address an urgent hotfix).
- **Add worktree**: `git worktree add ../<project>-<branch-name> <branch-name>`
- **Switch context**: Move to the sibling directory instead of changing branches in the current directory.
- **Cleanup**: `git worktree remove ../<project>-<branch-name>`

## 4. Commit Discipline
- Use **Conventional Commits** for all commits (`feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `test:`).
- Keep commits atomic and logically grouped.
- Include the Issue number in the footer if applicable: `Refs: #123`

## 5. PR Workflow
Execute this sequence when completing a task:
1. Ensure you are on the correct branch.
2. Commit all changes cleanly.
3. Push branch to remote and open a **Draft PR** early if work spans multiple sessions.
4. Populate the `.github/pull_request_template.md` fully.
5. Mark as **Ready for Review** when complete.
6. Address any feedback (pushing new commits or amending).
7. Decide on merge strategy (usually **Squash and Merge** for features).
8. Merge the PR, ensuring the linked issue closes automatically (e.g., using "Resolves #123").
9. Delete the remote branch.

## 6. Merge Strategies
- **Squash and Merge** (Default for PRs): Combines all feature branch commits into a single commit on `main`. Keeps history clean.
- **Rebase and Merge**: Keeps individual commits, rewrites history to be linear. Use when the PR has multiple significant, standalone commits.
- **Merge Commit**: Preserves the exact history and branch topology. Rarely used unless preserving complex feature branch history is critical.

## 7. Conflict Resolution
- Always pull `main` and rebase your feature branch against it: `git fetch origin && git rebase origin/main`
- If conflicts occur, resolve them carefully, preserving both intentions if necessary, then `git rebase --continue`.
- Never use `--force` on `main`. Only use `--force-with-lease` on your feature branches.

## 8. Branch Protection
Ensure the repository has these branch protection rules on `main`:
- Require pull request reviews before merging
- Require status checks to pass before merging (Lint, Test, Build)
- Require linear history (optional but recommended)
- Do not allow bypassing the above settings

## 9. Common Commands
- `git fetch origin`
- `git checkout -b <branch>`
- `git commit -m "<type>: <msg>"`
- `git push -u origin HEAD`
- `git rebase origin/main`
