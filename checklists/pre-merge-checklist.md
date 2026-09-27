# Pre-Merge Checklist

> **Purpose**: Verify that code is genuinely ready for review and merge. Run this checklist before creating a Pull Request. Every item must be satisfied — if an item cannot be satisfied, document the exception and get explicit approval to skip it.
>
> **When to use**: Before creating any Pull Request (features, bugs, refactors, chores, docs).
>
> **Who runs it**: The author of the PR (the person/agent who wrote the code).

---

## PR Information

```
PR Title:      [type(scope): description]
GitHub Issue:  Closes #[issue-number]
Branch:        [branch-name]
Base Branch:   [main / develop / etc.]
Author:        [Name or agent]
Date:          [YYYY-MM-DD]
```

---

## 1. Code Quality

### 1.1 Linting & Formatting

- [ ] **Linter passes with zero errors** — Run the project's linter and confirm no errors
  - Command: `[linter command, e.g., npm run lint / flake8 . / golangci-lint run]`
  - ⚠️ Warnings are acceptable only if they existed before this PR — do not introduce new warnings
- [ ] **Formatter reports no changes needed** — Run the formatter in check mode
  - Command: `[formatter command, e.g., prettier --check . / black --check . / gofmt -l .]`
  - If the formatter makes changes: stage and commit them before opening the PR
- [ ] **No linting rules disabled inline without justification** — Any `eslint-disable`, `noqa`, `#nosec` comment must have an explanation of why the suppression is acceptable

### 1.2 Code Cleanliness

- [ ] **No debug code** — Removed all temporary debug statements:
  - JavaScript/TypeScript: `console.log`, `console.debug`, `debugger`
  - Python: `print()`, `pdb.set_trace()`, `breakpoint()`
  - Java: `System.out.println()`
  - Go: `fmt.Println()` used for debugging
  - Ruby: `puts`, `binding.pry`, `require 'pry'`
- [ ] **No commented-out code blocks** — If code is commented out, it should be deleted
  - Rationale: Commented-out code clutters the codebase; git history preserves deleted code
  - Exception: Code that is intentionally commented with a clear explanation and linked GitHub Issue
- [ ] **No TODO/FIXME/HACK comments without GitHub Issue links**
  - ❌ Bad: `# TODO: fix this later`
  - ✅ Good: `# TODO(#142): handle pagination when results exceed 1000 items`
  - Unlinked TODOs without a GitHub Issue must be resolved or linked before merging
- [ ] **No hardcoded values** that should be configuration, constants, or environment variables
  - API endpoints, credentials, magic numbers, environment-specific strings
- [ ] **No temporary or throwaway code** — "Quick hacks" have no place in a merged PR

### 1.3 Code Logic

- [ ] **All edge cases handled** — Review against the list of edge cases from the implementation plan
  - What happens with empty/null/undefined inputs?
  - What happens at min/max boundary values?
  - What happens when a dependency fails or returns unexpected data?
- [ ] **All error paths handled** — No silent error swallowing; errors are logged, propagated, or handled appropriately
- [ ] **No obvious performance issues** — No N+1 queries, no unbounded loops, no blocking operations in async contexts
- [ ] **No memory leaks** — Event listeners removed, connections closed, timers cleared where needed
- [ ] **Inputs are validated** — All external inputs (API parameters, form data, file uploads, env vars) are validated at entry points

### 1.4 Security

- [ ] **No sensitive data exposed**:
  - No credentials, API keys, tokens, passwords, or PII in code
  - No sensitive data in log statements
  - No sensitive data in error messages returned to clients
- [ ] **No SQL injection vectors** — All database queries use parameterized statements or an ORM (no string interpolation into queries)
- [ ] **No XSS vectors** — User-supplied data is never rendered as raw HTML without sanitization
- [ ] **Authorization checks in place** — Every endpoint that handles user data verifies the user has permission to access it
- [ ] **Dependencies not introducing vulnerabilities** — Run `npm audit`, `safety check`, `bundle audit`, or equivalent

---

## 2. Tests

### 2.1 Test Coverage

- [ ] **Unit tests written** for all new business logic
  - Every new function/method with meaningful behavior has at least one test
  - Happy path, edge cases, and error cases covered
- [ ] **Integration tests written** for component boundaries
  - New API endpoints have integration tests
  - New database interactions have integration tests
- [ ] **End-to-end test added** (if required by the feature type and test strategy)
- [ ] **No tests deleted** without explicit justification — Reducing test coverage requires documented reason
- [ ] **Test coverage did not regress** — New code meets or exceeds the project's coverage threshold

### 2.2 Test Quality

- [ ] **All tests are meaningful** — Tests verify behavior, not just that code runs without exceptions
  - ❌ Bad: `assert function() is not None`
  - ✅ Good: `assert calculate_tax(100, 0.15) == 15.0`
- [ ] **Tests are deterministic** — Tests produce the same result on every run (no flaky tests introduced)
  - Random data: seeded or using fixed test fixtures
  - Time: mocked or frozen
  - External services: mocked
- [ ] **Test names are descriptive** — A failing test name should tell you exactly what broke
  - Format: `test_[what]_[condition]_[expected_outcome]` or `describe/it` equivalent
- [ ] **Tests are isolated** — No test depends on the state left by another test
- [ ] **Test data is clean** — Test fixtures are minimal and self-documenting

### 2.3 Test Execution

- [ ] **All tests pass locally** — Run the full test suite on your machine before pushing
  - Command: `[test command, e.g., npm test / pytest / go test ./... / rspec]`
- [ ] **No skipped tests added** without documented reason and linked GitHub Issue
  - `it.skip`, `@pytest.mark.skip`, `xit`, `pending` — all require justification

---

## 3. Pull Request Completeness

### 3.1 PR Description

- [ ] **PR uses the project's PR template** — Never submit a blank PR description
- [ ] **PR title follows Conventional Commits format**:
  - `feat(auth): add OAuth2 login with GitHub`
  - `fix(api): return 404 instead of 500 for missing resources`
  - `docs(readme): add Docker Compose setup instructions`
- [ ] **Summary section filled out** — 2-5 sentences describing what changed and why
- [ ] **Motivation section filled out** — Why does this PR exist? What problem does it solve?
- [ ] **How to Test section filled out** — Step-by-step instructions for a reviewer to manually test the changes
- [ ] **Related Issues section filled out** — `Closes #[issue-number]` (or `Fixes`, `Resolves`)
- [ ] **Breaking changes documented** — If the PR introduces breaking changes, they are clearly called out with migration instructions

### 3.2 Visual Evidence (UI/UX Changes)

- [ ] **Screenshots provided** — Before and after screenshots for any visual changes
- [ ] **Screen recording provided** (if the change involves animation, interaction, or multi-step UI flows)
- [ ] **Responsive design verified** — Screenshots at multiple viewport sizes (mobile, tablet, desktop) if applicable
- [ ] **Accessibility verified** — Keyboard navigation, screen reader compatibility, color contrast checked

### 3.3 Issue Linkage

- [ ] **GitHub Issue linked** — PR body contains `Closes #[N]` (or equivalent) to auto-close on merge
- [ ] **PR is linked to the correct milestone** on GitHub Projects
- [ ] **Issue is in the correct state** on the Projects board (`👀 In Review`)

---

## 4. Documentation

- [ ] **Inline code documentation updated** — New public functions/methods/classes have docstrings
- [ ] **README updated** — If setup, usage, configuration, or environment variables changed
- [ ] **API documentation updated** — If new endpoints added or existing ones modified (OpenAPI spec, etc.)
- [ ] **CHANGELOG.md updated** — Entry added under `[Unreleased]` for user-facing changes
  - Not required for pure refactors, chores, or internal changes that don't affect users
- [ ] **ADR created or updated** — If a significant architectural decision was made during this PR

---

## 5. CI/CD Status

- [ ] **All CI checks passing** — Green across all required status checks:
  - [ ] Lint
  - [ ] Format
  - [ ] Tests
  - [ ] Build
  - [ ] Security scan (if configured)
  - [ ] Coverage threshold
- [ ] **No CI warnings introduced** that weren't present before
- [ ] **Branch is up to date with the base branch** — No conflicts with `main` (or the target base branch)
  - If behind: `git rebase origin/main` and resolve any conflicts
- [ ] **CI passed on the most recent commit** (not a stale green from a previous push)

---

## 6. Self-Review

> *Read your own code as if you're reviewing someone else's work. Be honest and thorough.*

- [ ] **Full diff reviewed line by line**: `git diff main..HEAD`
  - Does every change make sense in context?
  - Is anything missing that should be there?
  - Is anything present that shouldn't be there?
- [ ] **Code matches the acceptance criteria** — Walk through each acceptance criterion; confirm the code satisfies it
- [ ] **Code matches the implementation plan** — No significant deviations without documented reason
- [ ] **No files accidentally included** — `.env` files, local config, IDE files, build artifacts are not staged
- [ ] **File structure is appropriate** — New files are in the right directories, following project conventions
- [ ] **Commit history is clean** — Commits are atomic, follow Conventional Commits, and tell the story of the change
  - No "WIP", "fix", "asdf", or "temp" commits in the final PR

---

## 7. Final Sign-Off

Before clicking "Create Pull Request":

- [ ] ✅ Code quality checks passed (linting, formatting, static analysis)
- [ ] ✅ All tests pass and coverage is maintained
- [ ] ✅ No debug code, commented-out blocks, or unlinked TODOs
- [ ] ✅ PR description is complete and accurate
- [ ] ✅ Screenshots/recordings attached for UI changes
- [ ] ✅ GitHub Issue is linked with `Closes #N`
- [ ] ✅ CHANGELOG updated (if user-facing change)
- [ ] ✅ No sensitive data exposed anywhere in the diff
- [ ] ✅ Self-review completed and satisfied
- [ ] ✅ CI is green on the latest commit

> **If any item above is unchecked, the PR is not ready to be created. Fix the issue first.**

---

## Exception Process

If a checklist item cannot be satisfied (rare, but sometimes legitimate):

1. **Document the exception** in the PR description under a "Exceptions" section
2. **Explain why** the item cannot be satisfied for this specific PR
3. **Get explicit approval** from the team lead or a senior reviewer before merging
4. **Create a follow-up GitHub Issue** to address the gap if it represents ongoing technical debt

Exceptions are visible in the PR record and are not a sign of failure — they are a sign of honest, traceable decision-making.

---

*Template version: 1.0 | Part of Agent SDLC Brain*
