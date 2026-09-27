---
name: ticket-management
description: |-
  Use this skill to create, manage, and track work using GitHub Issues and GitHub Projects. Activates when creating any new work item — feature, bug, tech debt, spike — or when managing the project backlog. Teaches the agent to write high-quality GitHub Issues with the right template, apply labels and milestones, manage issue lifecycle states, link issues to branches and pull requests, and keep GitHub Projects boards up to date.
---

# SKILL: Ticket Management

This skill dictates the procedures and standards for tracking work in the form of tickets (GitHub Issues) and managing those tickets using GitHub Projects. Ensure strict adherence to ticket types, formatting, label taxonomy, and lifecycle management.

## Ticket Types

Select the correct ticket type for every new piece of work:
- **Feature**: New functionality, system capability, or user-facing change.
- **Bug**: Something broken, unexpected behavior, or a regression.
- **Tech Debt**: Code quality improvements, refactoring, performance fixes not related to new capabilities.
- **Spike**: Time-boxed research or investigation tasks designed to answer a specific question.
- **Chore**: Maintenance, dependencies updates, configuration changes, CI/CD adjustments.

## GitHub Issue Anatomy

Every ticket must contain the following core elements:
1. **Title**: Follow conventions (`[type]: [short description]`).
2. **Description**: Use the specific template for the ticket type.
3. **Labels**: Categorize the ticket accurately (see taxonomy below).
4. **Assignee**: Assign to the relevant developer or agent working on the ticket.
5. **Milestone**: Assign to the current or upcoming milestone (sprint/release).
6. **Project**: Link the ticket to the relevant GitHub Projects board.

## Label Taxonomy

Create and apply the following standardized labels across repositories:

**Type**
- `type: feature`
- `type: bug`
- `type: tech-debt`
- `type: spike`
- `type: chore`

**Priority**
- `priority: critical` - Drop everything, impacts production significantly.
- `priority: high` - Important for current release.
- `priority: medium` - Standard priority.
- `priority: low` - Nice to have, can be deferred.

**Size**
- `size: xs` - < 1 hour
- `size: s` - < 4 hours
- `size: m` - < 1 day
- `size: l` - < 3 days
- `size: xl` - Needs to be broken down

**Status**
- `status: blocked` - Waiting on external dependency or input.
- `status: needs-discussion` - Requires alignment before starting.
- `status: ready` - Fully groomed and ready for implementation.

## Issue Lifecycle

Follow the standardized column flow in GitHub Projects:
1. **Backlog**: Work identified but not yet prioritized or fully defined.
2. **Ready**: Fully defined (groomed), estimated, prioritized, and ready for work.
3. **In Progress**: Actively being worked on. Branch created.
4. **In Review**: Pull Request opened and awaiting review.
5. **Done**: PR merged and verified.
6. **Closed**: Issue formally closed.

## Branch Naming and Management

Create branches directly from the issue to establish linkage. Use consistent branch prefixes:
- Features: `feature/[issue-number]-[short-description]` (e.g., `feature/123-user-login`)
- Bugs: `bugfix/[issue-number]-[short-description]` (e.g., `bugfix/124-fix-auth-crash`)
- Chores: `chore/[issue-number]-[short-description]`
- Spikes: `spike/[issue-number]-[short-description]`

## Auto-Closing Issues

When opening a Pull Request, use GitHub keywords in the PR description to automatically close the associated issue upon merge:
- `Closes #[issue-number]`
- `Fixes #[issue-number]`
- `Resolves #[issue-number]`

## Milestones and Projects

- **Projects Column Management**: Update the issue's project status as work progresses. Automate this via GitHub Actions if possible (e.g., move to "In Review" when PR opens).
- **Milestones**: Group tickets logically into timeboxes (sprints) or release versions using GitHub Milestones. Ensure all issues in a milestone are completed before closing the milestone.
