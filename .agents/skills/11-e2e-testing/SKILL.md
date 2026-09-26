---
name: e2e-testing
description: |-
  Use this skill when designing or writing end-to-end (E2E) tests that simulate real user journeys through the full application stack. Activates when the user asks about E2E tests, UI automation, or verifying complete user flows. Teaches the agent to identify critical user paths, write stable E2E scenarios, manage test data, and integrate E2E tests into CI/CD pipelines.
---

# End-to-End (E2E) Testing Skill

## E2E Test Philosophy
E2E tests simulate a real user interacting with the application via the UI (usually a browser). 
**Goal:** Test the user journey, not the underlying code. Ensure that all layers (UI, API, DB) work together seamlessly from the user's perspective.

## When to Write E2E Tests
E2E tests are expensive to write, slow to run, and prone to flakiness. 
- **Rule of Thumb:** Only test the *Critical User Paths*.
- Identify the top 5-10 flows that, if broken, would cause catastrophic failure (e.g., User Login, Checkout process, Core value-add action).

## E2E Test Anatomy
1. **Preconditions**: Set up the environment and necessary data (often via API to save time).
2. **Steps**: Programmatic interactions with the UI (click, type, navigate).
3. **Assertions**: Verify the UI state changes appropriately.
4. **Cleanup**: Remove data created during the test.

## Stability Principles (Anti-Flakiness)
- **Use resilient selectors:** Use `data-testid` attributes (e.g., `<button data-testid="submit-btn">`) rather than CSS classes or brittle text selectors that change often.
- **Avoid hardcoded waits:** Never use `sleep(5000)`. Use framework-provided explicit waits (e.g., wait for an element to be visible, or wait for a specific network response).
- **Isolate test data:** Never depend on pre-existing production-like data. Each test should create its own unique data or run against a safely sandboxed environment.
- **Run headless:** In CI, run tests in headless mode for speed and stability.

## Framework Guidance
- **Playwright (Recommended):** Fast, modern, auto-waits, supports multiple browser engines, excellent tooling.
- **Cypress:** Great developer experience, tightly integrated, but architecturally limited (runs inside the browser).
- **Selenium:** The legacy standard. Wide language support but often slower and more prone to flakiness without careful configuration.

## Page Object Model (POM) Pattern
Instead of littering tests with raw selectors, abstract pages into classes/objects.
- **Page Object:** Encapsulates the selectors and actions for a specific page (e.g., `LoginPage.fillCredentials(user, pass)`).
- **Benefits:** If the UI changes, you update the selector in one place (the Page Object), not in dozens of tests.

## Test Data Management
- **Factories / Seed Scripts:** Use API calls or direct DB scripts to rapidly generate required states (e.g., creating a user account via API before the UI test tests the login screen).

## CI/CD Integration
- Due to execution time, E2E tests generally should **not** run on every commit.
- Run them on merges to the `main` branch, on a nightly schedule, or post-deployment to a staging environment.

## Flakiness Management
Even well-written E2E tests flake due to network blips.
- Implement **retry logic** (e.g., retry failed tests up to 2 times).
- Configure the framework to take a **screenshot** or **video recording** automatically upon test failure to aid debugging.
