# Ticket Lifecycle Deep Dive

This document details the lifecycle of a ticket from inception to completion, explaining state transitions, automation, and backlog management practices.

## States and Transitions

1. **Backlog**
   - **Definition:** The holding area for all recorded ideas, bugs, and tasks.
   - **Actions Required:** Regular grooming to ensure tickets are relevant. Tickets must have a type label.
   - **Transition Trigger:** Team decides to prioritize the work and begins grooming it.

2. **Ready (To Do)**
   - **Definition:** The ticket is fully groomed. It has a clear description, acceptance criteria, size estimation, and is prioritized for the current cycle.
   - **Actions Required:** Ensure `status: ready` label is applied (or the ticket is moved to the 'Ready' column).
   - **Transition Trigger:** Developer assigns themselves to the ticket and begins work.

3. **In Progress**
   - **Definition:** Active development is occurring.
   - **Actions Required:** A branch is created (e.g., `feature/123-name`). Ensure the assignee field is correct.
   - **Transition Trigger:** Developer opens a Pull Request.

4. **In Review**
   - **Definition:** Code is written and waiting for peer review.
   - **Actions Required:** PR must contain `Closes #123` in the description. PR template must be filled out. CI checks must pass.
   - **Transition Trigger:** PR is approved and merged into the main branch.

5. **Done**
   - **Definition:** The work is merged, deployed (to staging or prod), and verified against acceptance criteria.
   - **Actions Required:** Stakeholders notified if necessary.
   - **Transition Trigger:** N/A (Terminal state for workflow).

6. **Closed**
   - **Definition:** The issue is formally closed in GitHub.
   - **Actions Required:** Can happen automatically via the PR merge.

## Automation with GitHub Actions

Leverage GitHub Actions to reduce manual ticket management overhead:
- **Auto-Assign:** Automatically assign the creator or a specific rotation member when a bug is opened.
- **Auto-Label:** Use actions to label PRs based on paths changed, or issues based on keyword matching.
- **Auto-Close:** Enforce the use of closing keywords (`Fixes #123`) so merging a PR automatically closes the issue and moves it to "Done" in the project board.
- **Stale Issues:** Automatically label and eventually close issues that have had no activity for a specified period (e.g., 90 days).

## Backlog Grooming Best Practices

- **Frequent Review:** Review the backlog weekly or bi-weekly.
- **Prioritize:** Ensure the most valuable and urgent items are at the top.
- **Clarify:** Add missing acceptance criteria, link related issues, and break down `size: xl` tickets into smaller tasks.
- **Discard:** Be ruthless. Close issues that are "nice-to-have" but haven't been touched in months with a polite explanation.
