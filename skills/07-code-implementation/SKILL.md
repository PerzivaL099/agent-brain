---
name: code-implementation
description: |-
  Use this skill when writing, reviewing, or refactoring code. Activates during any coding task. Teaches the agent coding standards, clean code principles, SOLID principles, error handling patterns, and commit message conventions that apply regardless of tech stack. Always reference this skill alongside stack-specific knowledge.
---

# SKILL: Code Implementation

This skill defines the standards for writing high-quality, maintainable, and secure code. It applies universally across all technology stacks.

## Pre-Coding Checklist

Before writing code, verify:
- [ ] An implementation plan exists.
- [ ] Test scenarios have been identified.
- [ ] A dedicated branch has been created from `main` (or the appropriate base branch).

## Clean Code Principles

- **Meaningful Names:** Variable and function names must be intention-revealing, pronounceable, and searchable. Avoid abbreviations.
- **Small Functions:** Functions should do exactly one thing. If a function contains multiple levels of abstraction, extract them.
- **DRY (Don't Repeat Yourself):** Abstract duplicated logic into reusable components or functions.
- **KISS (Keep It Simple, Stupid):** Avoid clever, overly complex solutions when a simple, readable approach suffices.
- **YAGNI (You Aren't Gonna Need It):** Do not implement features or generalizations before they are explicitly needed.

## SOLID Principles

Write object-oriented and modular code respecting SOLID:
- **S**ingle Responsibility Principle: A class/module should have one, and only one, reason to change.
- **O**pen/Closed Principle: Software entities should be open for extension, but closed for modification.
- **L**iskov Substitution Principle: Subtypes must be substitutable for their base types without altering program correctness.
- **I**nterface Segregation Principle: Many client-specific interfaces are better than one general-purpose interface.
- **D**ependency Inversion Principle: Depend on abstractions, not on concretions.

## Error Handling Guidelines

- **Fail Fast and Explicitly:** Validate inputs early and throw errors immediately if preconditions fail.
- **Never Swallow Exceptions Silently:** Empty `catch` blocks are strictly forbidden. Always handle or rethrow.
- **Use Typed Errors:** Create specific error classes (e.g., `NotFoundError`, `ValidationError`) rather than using generic errors.
- **Log with Context:** Include relevant state variables and IDs in error logs to aid debugging.
- **Meaningful User Messages:** Map internal errors to user-friendly messages at the application boundary; do not expose stack traces to end-users.

## Commit Discipline

Follow the Conventional Commits specification strictly:
- Format: `<type>(<scope>): <description>`
- Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`, `ci`
- Keep commits atomic: One logical change per commit.
- Commit often to your feature branch.

## Code Organization Principles

Organize code logically:
- Group files by feature/domain rather than by type (e.g., controllers, services) when scaling.
- Define clear boundaries between modules. Use explicit exports.
- Keep the entry point clean; delegate logic to specific modules.

## Security-by-Default

- **Never hardcode secrets:** Use environment variables.
- **Validate all input:** Treat all external input (API requests, user forms, file uploads) as hostile.
- **Least Privilege:** Give services and database queries only the permissions they strictly need.

## Post-Coding Checklist

Before declaring work "ready for review", ensure:
- [ ] All new and existing tests pass.
- [ ] No dead code, unused variables, or commented-out logic remains.
- [ ] No debug logs (e.g., `console.log`, `print`) are left behind.
- [ ] Code has been self-reviewed against these guidelines.
