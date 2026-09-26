# PR Review Checklist

Use this checklist when conducting a code review to ensure comprehensive coverage.

## Correctness & Functionality
- [ ] Code solves the specific problem described in the linked issue.
- [ ] No unintended side effects or regressions introduced.
- [ ] Error scenarios and edge cases are handled appropriately.

## Tests
- [ ] Unit and/or integration tests are included.
- [ ] Tests verify both successful execution (happy path) and failure modes.
- [ ] Tests are readable and maintainable.
- [ ] CI pipeline is green.

## Design & Architecture
- [ ] Code follows SOLID principles and domain-driven design concepts.
- [ ] No duplicated logic (DRY principle).
- [ ] Functions and classes have single responsibilities.
- [ ] Separation of concerns is maintained (e.g., DB logic not in UI layer).

## Security
- [ ] Input validation is present for all external data.
- [ ] No hardcoded secrets, API keys, or passwords.
- [ ] Authentication and authorization checks are correctly applied.
- [ ] Safe from common vulnerabilities (XSS, SQLi, CSRF).

## Performance
- [ ] Database queries are optimized (no N+1 problems, proper indexing).
- [ ] Memory allocation is reasonable; no obvious memory leaks.
- [ ] No inefficient algorithms (e.g., O(N^2) where O(N) is possible).

## Readability & Maintainability
- [ ] Variable, function, and class names are clear, descriptive, and pronounceable.
- [ ] Complex logic is explained via concise comments (explaining *why*, not *what*).
- [ ] No dead, commented-out, or unreachable code.
- [ ] No left-over debugging statements (e.g., `console.log`, `print`).

## Documentation & Dependencies
- [ ] Any changes to APIs or interfaces are reflected in documentation.
- [ ] README is updated if setup/run instructions changed.
- [ ] Added dependencies are strictly necessary and evaluated for security/license.

## Breaking Changes
- [ ] If this introduces a breaking change, is it clearly marked in the PR title and description?
- [ ] Is there a migration path or deprecation strategy if necessary?
