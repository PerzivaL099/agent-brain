---
name: project-planning
description: |-
  Use this skill to break down a software project into a structured plan with milestones, sprints, and trackable GitHub Issues. Activates after architecture is complete, when the user says 'let's plan the project', 'create a roadmap', or 'break this into tasks'. Teaches the agent to create GitHub Projects boards, define milestones, estimate work using T-shirt sizing or story points, and produce a sprint plan.
---

# Project Planning

## Overview
Project planning translates architectural blueprints and requirements into a sequenced, actionable execution plan. This skill teaches the agent how to organize work into Epics, Stories, and Tasks, estimate effort, and set up agile tracking mechanisms using GitHub Projects and Issues.

## Planning Process
1. **Define Milestones**: Group work into major, deliverable phases (e.g., "MVP Release", "Beta 1").
2. **Break down into Epics**: High-level feature sets (e.g., "User Authentication").
3. **Break down into Stories/Tasks**: Actionable chunks of work.
4. **Estimate**: Assess the effort required for each chunk.
5. **Prioritize & Sequence**: Identify dependencies and order tasks.
6. **Sprint Planning**: Allocate work to specific timeboxes (sprints).

## GitHub Projects Setup
Set up a standard Kanban or Scrum board using GitHub Projects:
- **Backlog**: All unprioritized, unassigned work.
- **Ready**: Groomed tasks ready for the current sprint.
- **In Progress**: Work currently being tackled.
- **In Review**: Code complete, awaiting PR review/QA.
- **Done**: Merged and deployed.

## Hierarchy of Work
- **Milestone**: A major time-bound goal. Maps to GitHub Milestones.
- **Epic**: A large body of work that takes multiple sprints. Mapped via GitHub labels or tracking issues.
- **User Story**: A feature delivering value to the user. Maps to a standard GitHub Issue.
- **Task**: Technical work (e.g., "Setup database schemas") that doesn't necessarily have direct user value. Maps to a GitHub Issue.

## Estimation Techniques
- **T-Shirt Sizing (XS, S, M, L, XL)**: Best for high-level roadmap planning and epics.
- **Story Points (Fibonacci: 1, 2, 3, 5, 8, 13)**: Best for sprint planning to estimate complexity, effort, and risk combined.
*See [Estimation Techniques Reference](./references/estimation-techniques.md) for details.*

## Sprint Planning
A sprint is a fixed timebox (usually 2 weeks).
- **Velocity**: Historical average of story points completed per sprint.
- **Capacity**: Available team hours minus holidays/meetings.
- **Commitment**: The agreed-upon scope the team aims to deliver in the sprint.

## Dependency Mapping & Risks
- **Blockers**: Identify if Issue B cannot start until Issue A is completed. Note this explicitly in GitHub Issues.
- **Risks**: Identify technical or scheduling risks and create spike (research) issues if uncertainty is high.

## Expected Output
- GitHub Project board created with appropriate columns.
- GitHub Milestones defined.
- Backlog populated with prioritized, estimated GitHub Issues.
- A defined Sprint Plan and Project Roadmap.
