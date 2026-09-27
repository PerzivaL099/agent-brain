---
name: code-review
description: |-
  Use this skill when conducting a code review, creating a pull request for review, or responding to review feedback. Activates when the user asks to review code, create a PR, or when addressing review comments. Teaches the agent how to give high-quality, constructive code reviews and how to write PRs that are easy to review.
---

# SKILL: Code Review

This skill governs the process of reviewing code written by others and submitting code for review. High-quality code reviews prevent bugs, maintain architectural integrity, and share knowledge.

## The Reviewer Mindset

- **Goal:** Improve code quality and ensure system stability. Code review is not about proving superiority.
- **Tone:** Be constructive, objective, and polite. Critique the code, not the author.
- **Clarity:** Be explicit about what is a requirement vs. a suggestion.

## What to Review (Priority Order)

Evaluate Pull Requests systematically, prioritizing high-impact issues:
1. **Correctness:** Does this code solve the problem described in the ticket? Are there logic errors?
2. **Tests:** Are there sufficient tests? Do they test the right things (happy path and edge cases)?
3. **Design:** Is the architectural approach sound? Does it violate SOLID or Clean Code principles?
4. **Security:** Are there vulnerabilities? (e.g., SQL injection, exposed secrets, missing auth checks).
5. **Performance:** Are there obvious bottlenecks? (e.g., N+1 database queries, inefficient loops).
6. **Readability:** Is the code easy to understand? Are names meaningful?
7. **Style:** Formatting and naming conventions (though ideally handled by linters/formatters).

## Review Comment Conventions

Prefix your comments to clarify intent and severity:
- **Blocking:** Code must be changed before merging. (e.g., "Blocking: This query will cause an N+1 issue.")
- **Suggestion:** A non-blocking recommendation. (e.g., "Suggestion: We could use a `map` function here instead.")
- **Question:** Asking for clarification. (e.g., "Question: Why did we choose to bypass the cache here?")
- **Nit:** Minor, non-blocking issue (e.g., typos). (e.g., "Nit: Typo in variable name `recieveData` -> `receiveData`.")

## PR Author Responsibilities

- **Size:** Keep PRs small. Ideal size is < 400 lines of code. Acceptable is < 800. If larger, break it down.
- **Self-Review:** Always review your own diff before assigning a reviewer. Catch your own typos and forgotten `console.log`s.
- **Description:** Provide a clear, comprehensive description using the PR template. Provide context.
- **Responsiveness:** Address comments promptly. If you disagree with a comment, discuss it constructively.

## GitHub-Specific Review Actions

- **Request Changes:** Use this when there are blocking issues that MUST be addressed before merge.
- **Approve:** Use this when the PR is ready to merge (even if there are outstanding non-blocking "Nits" or "Suggestions").
- **Comment:** Use this for asking questions or leaving feedback without explicitly approving or blocking.
