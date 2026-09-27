---
name: unit-testing
description: |-
  Use this skill when writing, reviewing, or planning unit tests. Activates when implementing any function, class, or module that needs testing. Teaches the agent what to test, how to structure tests using the AAA pattern, how to write effective mocks and stubs, how to identify edge cases, and how to set meaningful coverage targets. Tech-stack agnostic but includes guidance for common frameworks.
---

# Unit Testing Skill

## What IS and IS NOT a unit test

**A unit test IS:**
- Highly isolated: Tests a single unit of work (function, class, module) in isolation.
- Extremely fast: Runs in milliseconds.
- Deterministic: Always passes or fails given the same input.
- Pure: Does NOT involve file I/O, database operations, or network calls.

**A unit test IS NOT:**
- Testing database queries or network connections (those are integration tests).
- Checking UI layout.
- Calling external services or third-party APIs.
- Slow or requiring extensive environment setup.

## The AAA Pattern (Arrange, Act, Assert)

Structure every unit test into three distinct phases separated by whitespace:
1. **Arrange**: Set up the initial state, configure mocks, prepare inputs.
2. **Act**: Execute the specific function or method being tested.
3. **Assert**: Verify the result, state change, or interactions.

## FIRST Principles for Good Tests

- **Fast**: They should run quickly so developers run them frequently.
- **Independent**: Tests must not depend on each other or run in a specific order.
- **Repeatable**: Must produce the same results across different environments.
- **Self-validating**: Output a boolean PASS/FAIL, requiring no manual inspection.
- **Timely**: Written alongside or just before the code they test (TDD).

## What to Test

- **Happy Path**: The most common, expected use case.
- **Edge Cases**: Empty inputs, null/undefined, extreme boundary values, very large values.
- **Error Conditions**: Invalid inputs, handling of thrown exceptions, network failures (mocked).
- **Business Logic**: Calculations, state transitions, domain rules.

## What NOT to Test

- **Third-party Libraries**: Trust that framework authors tested their code.
- **Trivial Getters/Setters**: Don't test properties unless they contain complex logic.
- **Framework Internals**: Avoid testing implementation details of the underlying language or framework.

## Test Doubles

When isolating a unit, replace external dependencies with Test Doubles:
- **Stub**: Returns a hardcoded, fixed value for a method call.
- **Mock**: Expects specific calls to be made; verifies interactions and behavior.
- **Spy**: Wraps a real implementation to track how many times it was called or with what arguments.
- **Fake**: A working, simplified implementation (e.g., an in-memory database).

## Test Naming Conventions

Use a clear, descriptive format: `should [expected behavior] when [condition]`
Example: `should throw ValidationError when email is malformed`

## Coverage Guidelines

- Aim for **80%+** on general business logic.
- Aim for **100%** on critical paths, complex algorithms, or core domain models.

## Red-Green-Refactor TDD Cycle

1. **Red**: Write a failing test for the new behavior.
2. **Green**: Write the minimal code needed to make the test pass.
3. **Refactor**: Improve the code structure without changing its behavior.

## Common Anti-Patterns
- **Testing implementation details**: Tests break when refactoring code that still produces the correct output.
- **Interdependent tests**: Tests relying on shared state or order of execution.
- **Flaky tests**: Tests that randomly pass or fail (often due to timing issues or poor isolation).
