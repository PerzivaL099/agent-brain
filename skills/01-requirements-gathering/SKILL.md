---
name: requirements-gathering
description: |-
  Use this skill when starting a new project or feature and needing to gather, elicit, and document requirements. Activates when the user says 'new project', 'new feature', 'let's build X', or asks how to gather requirements. Teaches the agent to systematically identify stakeholders, conduct requirement elicitation sessions, write user stories, classify functional and non-functional requirements, and produce a structured requirements document using GitHub Issues and GitHub Projects.
---

# Requirements Gathering

## Overview
Requirements gathering is the critical first step in the software development lifecycle (SDLC). The objective is to understand what needs to be built, why it needs to be built, and who it is for. This skill guides the agent through systematic elicitation, documentation, and translation into actionable GitHub Issues.

## Process
1. **Identify Stakeholders**: Determine who has a vested interest in the project.
2. **Elicit Requirements**: Use appropriate techniques to gather needs.
3. **Draft User Stories**: Frame requirements from the user's perspective.
4. **Define Functional & Non-Functional Requirements**: Distinguish what the system does vs. how well it does it.
5. **Prioritize**: Apply MoSCoW prioritization.
6. **Create GitHub Artifacts**: Turn requirements into GitHub Issues and link them to GitHub Projects.

## Stakeholder Identification Framework
- **Primary Stakeholders**: End-users, customers (direct beneficiaries).
- **Secondary Stakeholders**: Operations, support teams, administrators.
- **Key Decision Makers**: Product owners, sponsors, executives.
- **Subject Matter Experts (SMEs)**: Domain experts, legal/compliance officers.

## Elicitation Techniques
- **Interviews**: 1-on-1 conversations to understand specific pain points.
- **Workshops**: Group sessions to align multiple stakeholders.
- **Observation**: Shadowing users to see how they currently work.
- **Prototyping**: Building quick mockups to elicit feedback on visual and interactive elements.
*See [Elicitation Techniques Reference](./references/elicitation-techniques.md) for deeper details.*

## User Story Format
User stories should follow a standard template to ensure clarity and focus on value:
> **As a** [persona/role],
> **I want to** [action/feature],
> **So that** [benefit/value].

### INVEST Criteria
Validate every user story against the INVEST principles:
- **I**ndependent: Can be developed and delivered on its own.
- **N**egotiable: Not a rigid contract; leaves room for discussion.
- **V**aluable: Delivers clear value to the user or business.
- **E**stimable: Understandable enough to estimate effort.
- **S**mall: Can be completed within a single sprint/iteration.
- **T**estable: Has clear acceptance criteria to prove it works.

## Functional vs Non-Functional Requirements
### Functional Requirements
Define specific behaviors or functions. Example: "The system must allow users to reset their password via email."

### Non-Functional Requirements (NFRs)
Define system qualities and constraints:
- **Performance**: Response times, throughput.
- **Security**: Authentication, encryption, data privacy.
- **Scalability**: Ability to handle growth in users or data.
- **Usability**: Accessibility, ease of use.
- **Reliability**: Uptime, fault tolerance, disaster recovery.

## MoSCoW Prioritization
- **M**ust Have: Non-negotiable, project fails without them.
- **S**hould Have: Important, but not strictly necessary for MVP.
- **C**ould Have: Nice to have, if time and resources permit.
- **W**on't Have: Out of scope for the current phase.

## Creating GitHub Issues from Requirements
1. Map each prioritized user story to a GitHub Issue.
2. Apply standard labels (e.g., `enhancement`, `must-have`, `frontend`).
3. Include the User Story, Acceptance Criteria (Given/When/Then), and any notes in the issue body.
4. Link the issues to the appropriate GitHub Project board for tracking.

## Expected Output
- A complete Requirements Document.
- GitHub Issues created for all actionable requirements.
- Issues linked to a GitHub Project board.
