# New Project Kickoff Checklist

> **Purpose**: Ensure every new project starts on solid ground. This checklist is mandatory before writing any production code. Work through it sequentially — each section depends on the previous one being complete.
>
> **When to use**: Triggered at the start of any new project, service, application, or significant system component.
>
> **Owner**: Project lead / agent initiating the project.

---

## How to Use This Checklist

- ☐ = Not yet started
- ☑ = Complete
- ~~Item~~ = Not applicable (document why in the notes column)

Copy this checklist into the project's GitHub repository as `docs/project-kickoff.md` and track completion there.

---

## Section 1: Discovery

> *Understand the problem before proposing a solution. Every item in this section must be complete before moving to Section 2.*

### 1.1 Stakeholder Identification

- [ ] **Identify all stakeholders** — List everyone with an interest in or influence over this project
  - Primary stakeholders (directly affected by the outcome)
  - Secondary stakeholders (indirectly affected or who provide input)
  - Technical stakeholders (engineers, architects, DevOps)
  - Business stakeholders (product managers, executives, clients)
- [ ] **Identify the decision-maker** — Who has final authority on scope and priority?
- [ ] **Identify the primary contact** — Who answers questions about requirements?
- [ ] **Document stakeholders** in the project README or a dedicated `docs/stakeholders.md`

### 1.2 Requirements Sessions

- [ ] **Schedule and conduct requirements sessions** with primary stakeholders
- [ ] **Ask the five Ws**: Who will use it? What must it do? When is it needed? Where will it run? Why does it need to exist?
- [ ] **Capture functional requirements** — What the system must do
  - Use active voice: "The system shall [action] [object] [condition]"
  - Number all requirements for traceability (FR-001, FR-002, ...)
- [ ] **Capture non-functional requirements** — How the system must behave
  - Performance (response time, throughput, concurrency targets)
  - Scalability (expected load today, expected load in 12 months)
  - Availability (SLA targets, acceptable downtime windows)
  - Security (authentication, authorization, data protection requirements)
  - Compliance (regulatory, legal, or policy constraints)
  - Maintainability (code standards, documentation, handoff requirements)
- [ ] **Identify constraints** — Technology mandates, budget limits, timeline hard stops, existing integrations
- [ ] **Identify assumptions** — What are you taking for granted? Document them explicitly
- [ ] **Identify risks** — What could go wrong? What dependencies are outside the team's control?

### 1.3 User Stories

- [ ] **Write user stories** for every significant functional requirement
  - Format: `As a [type of user], I want [goal] so that [reason/value]`
  - Keep stories independent, negotiable, valuable, estimable, small, and testable (INVEST)
- [ ] **Validate stories with stakeholders** — Confirm each story represents something they actually need
- [ ] **Group related stories** into epics where appropriate
- [ ] **Create a GitHub Issue for each user story** using the feature request template

### 1.4 Acceptance Criteria

- [ ] **Write acceptance criteria for every user story**
  - Use Gherkin format: `Given [context], When [action], Then [outcome]`
  - Or use a numbered checklist format: "The feature is complete when: 1) ..., 2) ..., 3) ..."
  - Acceptance criteria must be testable — if you can't write a test for it, it's too vague
- [ ] **Review acceptance criteria with stakeholders** — Confirm they agree these criteria define "done"
- [ ] **Add acceptance criteria to GitHub Issues** as the issue body or a linked comment

### 1.5 MoSCoW Prioritization

- [ ] **Classify all requirements using MoSCoW**:
  - **Must Have**: Non-negotiable; the project fails without these
  - **Should Have**: Important but not critical for launch; include if possible
  - **Could Have**: Nice to have; include only if time and resources allow
  - **Won't Have (this time)**: Explicitly out of scope for this iteration; documented for future
- [ ] **Confirm MoSCoW classification with stakeholders** — The decision-maker must agree
- [ ] **Label GitHub Issues** with priority labels reflecting MoSCoW classification
- [ ] **Document the scope boundary** — Explicitly state what is OUT of scope to prevent scope creep

### 1.6 Definition of Done

- [ ] **Establish the project-level Definition of Done (DoD)**
  - What conditions must every user story meet to be considered complete?
  - Example: Code reviewed, tests written and passing, documentation updated, deployed to staging
- [ ] **Document the DoD** in the project README or `CONTRIBUTING.md`
- [ ] **Get stakeholder agreement** on the DoD

---

## Section 2: GitHub Setup

> *The repository is the team's shared workspace. Set it up right from day one.*

### 2.1 Repository Creation

- [ ] **Create the GitHub repository**
  - Name: kebab-case, descriptive, reflects the project domain
  - Visibility: Private (default) unless explicitly intended to be public
  - Initialize with README (or push initial commit immediately)
- [ ] **Add repository description** — One sentence describing what this project does
- [ ] **Add repository topics/tags** — Technology stack, domain, and project type
- [ ] **Create initial README.md** with:
  - Project name and one-paragraph description
  - Tech stack overview
  - Local development setup instructions (even if placeholder)
  - Links to key documentation

### 2.2 Branch Protection Rules

- [ ] **Protect the `main` branch** with rules:
  - ☐ Require a pull request before merging
  - ☐ Require at least 1 approval (or 2 for teams >3 people)
  - ☐ Dismiss stale pull request approvals when new commits are pushed
  - ☐ Require status checks to pass before merging (add CI check names once CI is set up)
  - ☐ Require branches to be up to date before merging
  - ☐ Do not allow bypassing the above settings (even for admins)
- [ ] **Protect any other long-lived branches** (e.g., `develop`, `staging`) with appropriate rules

### 2.3 Labels Setup

- [ ] **Delete default GitHub labels** (or relabel to match the taxonomy)
- [ ] **Create type labels**: `type: feature`, `type: bug`, `type: chore`, `type: docs`, `type: refactor`, `type: spike`, `type: security`
- [ ] **Create priority labels**: `priority: critical`, `priority: high`, `priority: medium`, `priority: low`
- [ ] **Create status labels**: `status: blocked`, `status: needs-design`, `status: needs-review`, `status: ready`, `status: in-progress`
- [ ] **Create size labels**: `size: xs` (< 2h), `size: s` (2-4h), `size: m` (1d), `size: l` (2-3d), `size: xl` (> 3d)
- [ ] **Create environment labels** (if relevant): `env: production`, `env: staging`

### 2.4 GitHub Projects Board

- [ ] **Create a GitHub Project** for this project (use the new GitHub Projects, not classic)
- [ ] **Configure board columns** (Kanban view):
  - `📋 Backlog` — All issues not yet scheduled
  - `🔜 Ready` — Issues refined and ready for development
  - `🔨 In Progress` — Issues currently being worked on
  - `👀 In Review` — Issues with open PRs awaiting review
  - `✅ Done` — Completed and merged issues
- [ ] **Add all GitHub Issues** to the project board
- [ ] **Configure automation** — Set up auto-move rules (e.g., "when PR is opened, move to In Review")
- [ ] **Set up sprint/iteration cycles** if using sprint-based development

### 2.5 Issue Templates

- [ ] **Create issue templates** in `.github/ISSUE_TEMPLATE/`:
  - [ ] `feature_request.md` — For new features
  - [ ] `bug_report.md` — For bugs
  - [ ] `task.md` — For chores and technical tasks
  - [ ] `spike.md` — For research/investigation tasks
- [ ] **Create PR template** at `.github/pull_request_template.md`
- [ ] **Test issue templates** by creating a test issue for each template type and deleting afterward

### 2.6 Access & Permissions

- [ ] **Add all team members** with appropriate permission levels
  - Write: Engineers actively committing
  - Maintain: Tech leads managing branches and settings
  - Admin: Project lead only
- [ ] **Configure GitHub Actions permissions** — Ensure CI has the minimum permissions needed
- [ ] **Set up required secrets** in repository or organization settings (API keys, tokens for CI)

---

## Section 3: Architecture

> *Make deliberate design decisions before writing code. Undocumented decisions become technical debt.*

### 3.1 Technology Stack Evaluation

- [ ] **List candidate technology options** for each layer of the stack
- [ ] **Evaluate each option against criteria**:
  - Fit for the requirements (especially non-functional)
  - Team familiarity and learning curve
  - Community health and long-term viability
  - Operational complexity (deployment, monitoring, scaling)
  - License compatibility
- [ ] **Make a decision for each stack layer** and document why
- [ ] **Record the decision as an ADR** (Architecture Decision Record): `docs/adr/ADR-001-tech-stack.md`

### 3.2 System Design

- [ ] **Draw the system architecture diagram**
  - Show all major components (services, databases, queues, external APIs, CDNs, etc.)
  - Show data flow between components
  - Label all communication protocols (REST, gRPC, WebSocket, message queue, etc.)
  - Indicate synchronous vs. asynchronous communication
- [ ] **Document component responsibilities** — What does each component do? What doesn't it do?
- [ ] **Define system boundaries** — What is inside this project? What is external?
- [ ] **Identify and document cross-cutting concerns**: logging, authentication, error handling, caching
- [ ] **Store diagram in `docs/architecture/`** (use a format that can be version-controlled: PlantUML, Mermaid, or Lucidchart export)

### 3.3 Architecture Decision Records (ADRs)

- [ ] **Establish the ADR template** at `docs/adr/TEMPLATE.md`
- [ ] **Write ADRs for each significant decision**:
  - [ ] ADR-001: Technology stack selection
  - [ ] ADR-002: Database design and storage strategy
  - [ ] ADR-003: Authentication and authorization approach
  - [ ] ADR-004: API design style (REST / GraphQL / gRPC / etc.)
  - [ ] ADR-005: Deployment and hosting strategy
  - [ ] Additional ADRs for any other significant decisions
- [ ] **ADR format**: Title, Date, Status, Context, Decision, Consequences

### 3.4 API Contracts

- [ ] **Define API contracts before implementing them**
  - For REST APIs: OpenAPI/Swagger specification
  - For GraphQL: Schema Definition Language (SDL) file
  - For gRPC: `.proto` files
  - For internal modules: Interface definitions in the chosen language
- [ ] **Review API contracts with stakeholders** — Front-end/consumer teams must approve contracts
- [ ] **Store contracts in the repository** at `docs/api/` or `api/` directory
- [ ] **Version the API** — Decide on the versioning strategy (URL path, header, query param)

### 3.5 Database / Data Schema Design

- [ ] **Design the data model** before writing any ORM models or SQL
  - Draw an Entity-Relationship (ER) diagram
  - Define entities, attributes, and relationships
  - Identify primary keys, foreign keys, indexes
- [ ] **Review data model against requirements** — Can every functional requirement be satisfied by this schema?
- [ ] **Plan migration strategy** — How will schema changes be managed? (Migration files, versioned scripts)
- [ ] **Document data retention and deletion policies** — Especially for user data (GDPR/CCPA considerations)
- [ ] **Store ER diagram and schema docs** in `docs/database/`

### 3.6 Security Review

- [ ] **Perform a threat model** — What are the attack surfaces? What data is sensitive?
- [ ] **Define authentication strategy** — How will users authenticate?
- [ ] **Define authorization strategy** — How will permissions be enforced?
- [ ] **Identify secrets management approach** — How will API keys, credentials be stored and rotated?
- [ ] **Plan for input validation** — Where and how will all inputs be validated?
- [ ] **Plan for output encoding** — How will the app prevent XSS/injection?
- [ ] **Review compliance requirements** — GDPR, HIPAA, SOC2, PCI-DSS, etc.
- [ ] **Document security decisions** in an ADR or dedicated `docs/security.md`

---

## Section 4: Project Setup

> *A properly scaffolded project prevents entire categories of future problems.*

### 4.1 Repository Scaffolding

- [ ] **Initialize project scaffold** using the appropriate framework/toolchain CLI or template
- [ ] **Configure `.gitignore`** — Use a comprehensive template for the chosen stack; review and customize
  - Never commit: secrets, credentials, compiled artifacts, local config, OS files
- [ ] **Configure `.editorconfig`** — Ensure consistent editor settings across team members
  - Indent style, indent size, end-of-line characters, charset, trim trailing whitespace

### 4.2 Code Quality Tooling

- [ ] **Configure linter** for the chosen language/stack
  - Install and configure (e.g., ESLint, Pylint, RuboCop, golangci-lint, Checkstyle)
  - Define and commit the configuration file
  - Ensure linter runs in CI
- [ ] **Configure formatter** for the chosen language/stack
  - Install and configure (e.g., Prettier, Black, gofmt, rustfmt)
  - Define and commit the configuration file
  - Ensure formatter check runs in CI
- [ ] **Configure static analysis** (optional but recommended)
  - Security: Bandit, Semgrep, CodeQL
  - Complexity: detect code smells early

### 4.3 Pre-commit Hooks

- [ ] **Install pre-commit hook framework** (e.g., `pre-commit`, `husky`, `lefthook`)
- [ ] **Configure hooks to run locally before each commit**:
  - [ ] Lint check
  - [ ] Format check (or auto-format)
  - [ ] No debug artifacts (console.log, pdb, byebug, etc.)
  - [ ] No secret detection (gitleaks, detect-secrets)
  - [ ] Commit message validation (Conventional Commits format)
- [ ] **Document how to install hooks** in `CONTRIBUTING.md` or README

### 4.4 CI/CD Pipeline Skeleton

- [ ] **Create initial CI pipeline** in `.github/workflows/ci.yml`:
  - [ ] Trigger: on push to any branch, on pull request to main
  - [ ] Jobs: install dependencies → lint → format check → test → build
  - [ ] Use dependency caching to speed up runs
  - [ ] Configure to run in a matrix if supporting multiple OS/runtime versions
- [ ] **Create CD pipeline skeleton** in `.github/workflows/deploy.yml`:
  - [ ] Trigger: on push to main (or manual trigger)
  - [ ] Deploy to staging (at minimum)
  - [ ] Leave production deploy commented out or manual until deployment strategy is finalized
- [ ] **Add CI badge to README**

### 4.5 Environment Configuration

- [ ] **Define environment variable schema** — List all required environment variables
- [ ] **Create `.env.example`** — A template with all required variables, no real values
- [ ] **Add `.env` and all local config files** to `.gitignore`
- [ ] **Document all environment variables** with descriptions in `docs/configuration.md`
- [ ] **Configure secrets** in GitHub repository settings for CI/CD use

### 4.6 Documentation Foundation

- [ ] **Complete the README** with:
  - Project description and purpose
  - Architecture overview (link to `docs/architecture/`)
  - Prerequisites and local development setup
  - Running tests
  - Environment variable reference
  - Deployment instructions
  - Contributing guide
  - License
- [ ] **Create `CONTRIBUTING.md`** — How to contribute: branch naming, commit format, PR process
- [ ] **Create `CHANGELOG.md`** — Initialize with `## [Unreleased]` section (follow Keep a Changelog format)
- [ ] **Create `LICENSE`** — Add appropriate license file

---

## Section 5: Implementation Foundation

> *Prove the scaffolding works before building on it. Fix foundational issues now, not after 10,000 lines of code.*

### 5.1 Project Scaffold Verification

- [ ] **Clone the repository to a clean machine/environment** — Verify setup instructions work from scratch
- [ ] **Follow the README setup steps exactly** — If anything fails, fix the README AND the issue
- [ ] **Confirm the project runs** (even if it just shows a "Hello World" or default framework page)
- [ ] **Confirm the linter runs clean** on the initial scaffold
- [ ] **Confirm the formatter reports no issues** on the initial scaffold
- [ ] **Confirm pre-commit hooks are working** — Stage a test file, attempt to commit

### 5.2 Testing Framework Setup

- [ ] **Install and configure the test framework** for the chosen stack
- [ ] **Configure test coverage reporting**
- [ ] **Write the first test** — A trivial test that proves the framework works (e.g., `assert 1 == 1`)
- [ ] **Confirm the test passes** and coverage report generates
- [ ] **Configure CI to fail on coverage below threshold** (suggest starting at 70%, move to 80%+ over time)

### 5.3 Core Infrastructure Verification

- [ ] **Verify database connectivity** — If the project uses a database, confirm it connects and can run migrations
- [ ] **Verify external service connectivity** — If the project calls external APIs, verify connectivity (using test/sandbox endpoints)
- [ ] **Verify authentication middleware is in place** — Even if not fully implemented, the hooks should exist
- [ ] **Verify logging is configured** — Application should emit structured logs from day one

### 5.4 First Smoke Test

- [ ] **Write and run the first real smoke test** — A test that exercises the full stack end-to-end
  - For a web API: an integration test that hits the health check endpoint and verifies a 200 response
  - For a CLI tool: a test that invokes the main entry point and verifies non-error exit
  - For a library: a test that imports the library and calls its primary public function
- [ ] **Confirm the smoke test runs in CI**

### 5.5 First PR Dry-Run

- [ ] **Create a test feature branch**: `chore/project-setup-verification`
- [ ] **Make a trivial change** (add a comment, update a README line)
- [ ] **Commit using Conventional Commits format**: `chore: verify project setup and CI pipeline`
- [ ] **Open a PR** using the PR template
- [ ] **Verify CI pipeline runs and passes** on the PR
- [ ] **Verify branch protection rules are enforced** (can't merge without CI passing)
- [ ] **Merge the PR** and verify it appears cleanly in the git history
- [ ] **Verify the branch is deleted** after merging

---

## Kickoff Complete ✅

When all items above are checked:

- [ ] **Archive this checklist** by committing it to `docs/project-kickoff.md` in the repository
- [ ] **Hold a kickoff meeting** (or async equivalent) to announce development is beginning
- [ ] **Move the first sprint's issues** to "Ready" on the GitHub Projects board
- [ ] **Begin implementation** following the feature-lifecycle.md checklist for each issue

---

*Template version: 1.0 | Part of Agent SDLC Brain*
