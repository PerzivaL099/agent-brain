---
name: implementation-planning
description: |-
  Use this skill before starting to code any feature, bug fix, or technical change. Activates when a GitHub Issue is ready to be worked on, or when the user says 'let's implement this', 'how should we build this', or 'plan this feature'. Teaches the agent to break down a ticket into technical sub-tasks, identify dependencies, choose implementation approach, estimate complexity, and write a mini implementation plan before touching code.
---

# SKILL: Implementation Planning

This skill outlines the mandatory planning phase required before writing code for any issue. The goal is to design the technical solution, identify risks, and create a roadmap of small, actionable tasks.

## The Planning Checklist

Do this before writing ANY code:
1. **Re-read the Ticket:** Ensure complete understanding of the problem and acceptance criteria.
2. **Identify Affected Components:** Determine exactly which files, modules, databases, or services will need modification.
3. **Identify Dependencies:** Note any external services, APIs, other tickets, or internal modules this work relies on.
4. **Choose Implementation Approach:** Document the technical design. Explain *what* you will build, *why*, and the trade-offs.
5. **Task Breakdown:** Break the work into technical sub-tasks. Each sub-task must be granular and completable in < 4 hours.
6. **Identify Test Cases:** List the unit, integration, and E2E tests needed to prove the code works.
7. **Identify Edge Cases:** Brainstorm error scenarios, edge cases, and failure modes.
8. **Estimate Complexity:** Provide a realistic assessment of the effort required.

## Technical Task Breakdown

Never work on a massive monolith of a feature. Break it down:
- Identify the core data structures/models.
- Identify the business logic layer.
- Identify the API/interface layer.
- Identify the UI/presentation layer.
Create tasks for each, allowing for iterative development and testing.

## Dependency Identification

Thoroughly map out:
- **Internal:** Does this require changes to shared utilities or core schemas?
- **External:** Does this rely on a third-party API? Is it mocked for testing?
- **Blockers:** Is another team or ticket blocking this implementation?

## Approach Documentation

Write a concise technical summary:
- **What:** The architecture or pattern chosen.
- **Why:** The reasoning behind the choice (e.g., performance, maintainability).
- **Trade-offs:** What are the downsides of this approach, and why are they acceptable?

## Risk Identification

Before touching the keyboard, identify:
- Security implications (e.g., data exposure, validation gaps).
- Performance impacts (e.g., N+1 query risks, large memory footprints).
- Regression risks (what existing feature might break?).

## Setup and Linkage

1. Create a branch named according to conventions (e.g., `feature/[issue-number]-name`).
2. Draft an implementation plan document (using the template) and share it for review if necessary.
