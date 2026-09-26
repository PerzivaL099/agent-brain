# 🧠 Agent SDLC Brain

> **The operating system for professional software development.**
> A curated, living knowledge base that transforms an AI agent into a disciplined, senior-grade software engineer — one that follows process, respects quality gates, and ships with confidence.

---

## What Is This?

The **Agent SDLC Brain** is a structured collection of skills, templates, checklists, and references that encode the full **Software Development Lifecycle (SDLC)** into the agent's operating context. It is not documentation for humans — it is an instruction manual that the agent reads, internalizes, and executes.

Every file in this brain represents hard-won engineering wisdom, distilled into actionable directives. The agent doesn't guess. It follows process.

---

## Why It Exists

Great software is not just about writing code. It's about:

- Understanding **what** to build before **how** to build it
- Making architecture decisions **explicitly** and **traceably**
- Writing tests **before** shipping, not after
- Treating every pull request as a **quality gate**
- Deploying with **confidence**, not hope
- Learning from failures through **blameless post-mortems**

Without a brain like this, an agent drifts — skipping steps, making assumptions, shipping half-baked features. **This brain prevents drift.**

---

## Structure

```
agent_brain/
│
├── README.md                          ← You are here
│
├── .agents/
│   ├── GEMINI.md                      ← Master always-on rules (identity, quality bar, principles)
│   ├── AGENTS.md                      ← Decision-making rules (when to activate which skill)
│   │
│   ├── checklists/
│   │   ├── new-project-kickoff.md     ← Master checklist for starting any new project
│   │   ├── feature-lifecycle.md       ← End-to-end checklist: idea → production
│   │   ├── pre-merge-checklist.md     ← What to verify before creating/merging a PR
│   │   ├── pre-deployment-checklist.md← Final checks before deploying to production
│   │   └── post-mortem-template.md    ← Incident post-mortem template
│   │
│   └── skills/                        ← (Populated incrementally)
│       ├── 01-requirements-gathering/
│       ├── 02-architecture-design/
│       ├── 03-project-planning/
│       ├── 04-github-setup/
│       ├── 05-implementation-planning/
│       ├── 06-code-implementation/
│       ├── 07-test-strategy/
│       ├── 08-git-workflow/
│       ├── 09-code-review/
│       ├── 10-ci-cd-pipeline/
│       ├── 11-deployment/
│       ├── 12-monitoring-observability/
│       ├── 13-incident-response/
│       ├── 14-documentation/
│       ├── 15-refactoring/
│       └── 16-dependency-management/
```

---

## The 16 Skills

The brain is organized around **16 core SDLC skills**, grouped into **4 phases**:

### Phase 1 — Define 🎯
> *Know exactly what you're building and why before writing a single line.*

| # | Skill | Purpose |
|---|-------|---------|
| 01 | **Requirements Gathering** | Elicit, validate, and document what stakeholders actually need |
| 02 | **Architecture Design** | Choose the right system design, document ADRs, draw boundaries |
| 03 | **Project Planning** | Break work into milestones, GitHub Issues, and sprint cycles |
| 04 | **GitHub Setup** | Configure repo, branch protection, labels, Projects board, templates |

### Phase 2 — Build 🔨
> *Implement with precision, write tests as you go, commit with intent.*

| # | Skill | Purpose |
|---|-------|---------|
| 05 | **Implementation Planning** | Design the implementation approach before writing code |
| 06 | **Code Implementation** | Write clean, testable, well-documented production code |
| 07 | **Test Strategy** | Determine what to test at which level and how to automate it |
| 08 | **Git Workflow** | Branch, commit (Conventional Commits), and PR like a pro |

### Phase 3 — Ship 🚀
> *Every merge and deploy is a quality gate, not a coin flip.*

| # | Skill | Purpose |
|---|-------|---------|
| 09 | **Code Review** | Review code systematically, provide actionable feedback |
| 10 | **CI/CD Pipeline** | Design and maintain automated build, test, and deploy pipelines |
| 11 | **Deployment** | Deploy safely with plans, rollbacks, and environment controls |
| 12 | **Monitoring & Observability** | Instrument applications, set up alerts, build dashboards |

### Phase 4 — Sustain 🔄
> *Keep the system healthy, learn from failures, manage technical debt.*

| # | Skill | Purpose |
|---|-------|---------|
| 13 | **Incident Response** | Detect, triage, resolve, and learn from production incidents |
| 14 | **Documentation** | Produce living docs: READMEs, ADRs, runbooks, API docs |
| 15 | **Refactoring** | Improve code structure without changing behavior, safely |
| 16 | **Dependency Management** | Audit, update, and secure project dependencies |

---

## How Skills Activate

Skills are not optional. They activate based on the context of the current task:

```
New project requested
  └─→ Skill 01 (Requirements) → Skill 02 (Architecture) → Skill 03 (Planning) → Skill 04 (GitHub Setup)

New feature requested
  └─→ Create GitHub Issue → Skill 05 (Implementation Planning) → Skill 06 (Code) → Skill 07 (Tests)

Code ready to merge
  └─→ pre-merge-checklist → Skill 08 (Git Workflow) → Skill 09 (Code Review)

Ready to deploy
  └─→ pre-deployment-checklist → Skill 11 (Deployment) → Skill 12 (Monitoring)

Production incident
  └─→ Skill 13 (Incident Response) → post-mortem-template → Skill 14 (Documentation)

Technical debt identified
  └─→ GitHub Issue → Skill 15 (Refactoring) or Skill 16 (Dependency Management)
```

The activation rules are formally defined in [`.agents/AGENTS.md`](.agents/AGENTS.md).

---

## Core Principles

These principles are non-negotiable and govern all decisions:

1. **Requirements before code** — Never write implementation before understanding the problem
2. **Architecture before architecture debt** — Make design decisions explicitly, not accidentally
3. **Test everything that matters** — Tests are not optional; they are part of the definition of done
4. **Document decisions, not just outcomes** — ADRs, PR descriptions, and issue comments create a traceable history
5. **Automate the pipeline** — Every quality gate should be enforced by CI, not willpower
6. **Ship incrementally** — Small, frequent releases reduce risk and accelerate feedback
7. **Fail fast, learn faster** — Post-mortems are learning events, not blame sessions

---

## How to Use This Brain

### As an Agent
The agent reads `GEMINI.md` on every session start. It consults `AGENTS.md` to determine which skills to activate. It uses `checklists/` to verify completeness at key gates. It follows skill-specific `SKILL.md` files for deep guidance.

### As a Human
Use this brain to:
- **Onboard** new team members by pointing them at the relevant skills
- **Audit** your current SDLC against the checklists
- **Extend** the brain by adding new skills in the `skills/` directory following the established pattern
- **Debate** process decisions by reviewing the ADRs embedded in skill references

---

## Contributing to the Brain

To add or improve a skill:

1. Create a directory: `skills/XX-skill-name/`
2. Add `SKILL.md` with YAML frontmatter (`name`, `description`)
3. Add `templates/` for copy-paste scaffolding
4. Add `references/` for deep-dive material (optional)
5. Update this README's skill table
6. Update `AGENTS.md` to include activation rules for the new skill

---

## Quality Bar

> *This brain enforces a high standard. Everything produced using these skills should be something a senior engineer is proud to ship.*

- ✅ No feature without tests
- ✅ No merge without review
- ✅ No deploy without passing CI
- ✅ No work without a GitHub Issue
- ✅ No decision without documentation
- ✅ No incident without a post-mortem

---

*Last updated: 2026-09-26 | Agent SDLC Brain v1.0*
