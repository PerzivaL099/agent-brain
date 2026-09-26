# Testing Anti-Patterns Deep Dive

## 1. Test Interdependence
**Problem:** Tests rely on the state left over from previous tests or must run in a specific order.
**Why it's bad:** Tests become fragile. Running a single test in isolation will fail. It makes parallel execution impossible.
**The Fix:** Every test must run in total isolation. Use `beforeEach` and `afterEach` to reset the environment, clear databases, and restore mocks.

## 2. Testing Implementation Details
**Problem:** Asserting on the internal workings of a function (e.g., checking if a specific private method was called).
**Why it's bad:** Refactoring the code to be more efficient without changing its external behavior will break the tests. This discourages refactoring.
**The Fix:** Test the public API only. Focus on inputs (state/arguments) and outputs (return values/observable state changes).

## 3. Flaky Tests
**Problem:** Tests that sometimes pass and sometimes fail without any code changes.
**Why it's bad:** Developers lose trust in the test suite and start ignoring test failures.
**The Fix:** Identify the source of non-determinism (usually time, network, random numbers, or test interdependence). Mock out time and external dependencies rigorously.

## 4. Slow Unit Tests
**Problem:** Unit tests that take seconds (or minutes) to run.
**Why it's bad:** Developers run them less often, breaking the TDD cycle.
**The Fix:** Ensure unit tests do not touch the filesystem, database, or network. If they do, they are integration tests and should be separated.

## 5. Testing Too Much in One Test
**Problem:** A single test case has multiple "Act" phases or dozens of assertions covering different behaviors.
**Why it's bad:** When the test fails, it is difficult to know exactly which behavior broke.
**The Fix:** Follow the "One Concept per Test" rule. Split complex tests into smaller, focused tests with descriptive names.

## 6. Insufficient Assertions
**Problem:** Tests that execute code but fail to assert the results adequately (or at all).
**Why it's bad:** It provides a false sense of security (high coverage but low confidence).
**The Fix:** Ensure the "Assert" phase verifies the core outcomes of the "Act" phase. Ensure error paths assert the *type* and *message* of the error.

## 7. Testing Private Methods
**Problem:** Trying to bypass access modifiers to test private methods directly.
**Why it's bad:** Private methods are implementation details. Testing them locks in the internal design.
**The Fix:** Test private methods indirectly by testing the public methods that call them. If a private method is too complex to test this way, it might belong in its own class as a public method.

## 8. Not Testing Error Paths
**Problem:** Only testing the "Happy Path" where everything goes right.
**Why it's bad:** Unhandled errors crash applications.
**The Fix:** Write specific tests that feed invalid inputs or force dependency failures to ensure the system handles errors gracefully.
