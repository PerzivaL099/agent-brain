# Coverage Guidelines Deep Dive

## Understanding Coverage Metrics
- **Line Coverage:** Has every line of code been executed by a test?
- **Statement Coverage:** Has every statement been executed? (Similar to line, but accounts for multiple statements on one line).
- **Branch Coverage:** Has every control structure (if/else, switch, loops) evaluated to both true and false? *This is the most critical metric.*
- **Function Coverage:** Has every function been called at least once?

## Why 100% Coverage Can Be Misleading
Chasing 100% code coverage across an entire codebase is an anti-pattern.
- It leads to testing boilerplate, getters/setters, and framework setup.
- It encourages developers to write tests that execute code but lack meaningful assertions just to bump the coverage percentage.
- **100% coverage does not mean 100% bug-free.**

## Establishing Realistic Goals
- **Core Domain/Business Logic:** Aim for **80-90% branch coverage**. This is where the highest risk of logical errors lives.
- **Critical Paths (e.g., Payment Processing):** Aim for **100% branch coverage**.
- **UI Components:** Do not use percentage goals. Focus on use-case coverage via integration/E2E tests.

## Mutation Testing
Standard coverage tools tell you if code was *executed*. Mutation testing tells you if your tests are *effective*.
- **Concept:** A tool injects small changes (mutations) into your code (e.g., changing `>` to `<`).
- **Execution:** It runs your test suite.
- **Result:** If the test suite passes despite the mutation, the test is weak (the mutant "survived"). If the test fails, the test is strong (the mutant was "killed").
- *Use mutation testing on critical business logic to guarantee test quality.*
