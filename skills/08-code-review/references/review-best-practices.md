# Code Review Best Practices: Deep Dive

## The Psychology of Code Review

Giving and receiving code reviews is a social interaction. The goal is to collaborate, not to audit or penalize.

- **Use "We" instead of "You":** Frame problems as shared challenges.
  - ❌ "You forgot to close the database connection."
  - ✅ "We should make sure to close the database connection here."
- **Ask Questions instead of Making Demands:** Guide the author to the solution.
  - ❌ "Extract this into a function."
  - ✅ "Could we extract this logic into a helper function to improve readability?"
- **Praise Good Code:** Reviews shouldn't only focus on negatives. Call out elegant solutions, thorough tests, or well-named variables.

## Giving Feedback That Gets Accepted

- **Be Specific:** Vague feedback is frustrating. Point to the exact line, explain the issue, and provide an example of how to fix it.
- **Explain the "Why":** Don't just quote rules; explain the rationale. "We should use a prepared statement here to prevent SQL injection."
- **Distinguish Opinions from Requirements:** If it's a stylistic preference not covered by a linter, mark it as a `Nit:` or `Suggestion:` and don't block the merge over it.

## Common Review Mistakes

1. **Bikeshedding:** Arguing extensively over trivial matters (like variable naming or formatting) while ignoring major architectural flaws. Let linters handle formatting. Focus on design.
2. **Review Fatigue:** Reviewing a 1000-line PR in one go. You will miss things. Demand smaller PRs, or take breaks.
3. **The Rubber Stamp:** Approving a PR without actually reading the code ("LGTM!"). This defeats the purpose of the review process.
4. **Ghosting:** Taking days to review a PR, blocking the author's progress. Review code promptly (ideally within 24 hours).

## The 10-Minute Review Warm-up Technique

Before adding line-by-line comments, take 10 minutes to understand the big picture:
1. Read the PR description and the linked issue.
2. Look at the file list. Which are the core domain files? Which are just tests or config?
3. Skim the high-level architecture changes. Does the approach make sense?
4. *Only then* start looking at individual functions and lines of code.

## Review Automation

Humans are bad at spotting formatting errors, missing imports, and simple syntax bugs. Offload this to machines:
- **Linters:** (e.g., ESLint, Flake8) to catch syntax and style issues.
- **Formatters:** (e.g., Prettier, Black) to enforce a consistent code style. No human review time should be spent on indentation.
- **Static Analysis:** (e.g., SonarQube, CodeQL) to detect security vulnerabilities and code smells automatically in CI.
