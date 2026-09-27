---
name: test-strategy
description: |-
  Use this skill to design the overall testing strategy for a project or feature. Activates at the start of a project or when the user asks 'how should we test this', 'what tests do we need', or 'what's our testing strategy'. Teaches the agent to apply the testing pyramid, choose the right test types for each part of the system, set coverage goals, and produce a test strategy document.
---

# Test Strategy Skill

## The Testing Pyramid
A fundamental concept detailing the ratio of tests in a healthy project:
- **Unit Tests (Base):** Most numerous. Fast, isolated, test pure logic.
- **Integration Tests (Middle):** Moderate number. Test boundaries, databases, APIs.
- **E2E Tests (Top):** Fewest number. Slow, fragile, test critical user journeys.

*(Alternative: The Testing Trophy focuses more heavily on Integration tests for modern web apps).*

## When to Use Each Test Type
- **Unit:** Pure functions, complex calculations, algorithms, domain model logic.
- **Integration:** API routing, database queries (DAOs/Repositories), interacting with file systems, service-to-service boundaries.
- **E2E:** The absolute critical paths (e.g., Login, Checkout, Core creation workflows).
- **Smoke:** A quick subset of tests run post-deployment to verify the environment is healthy.
- **Performance:** Load/stress testing done prior to major releases.
- **Security:** Automated OWASP dependency checks, SAST/DAST tooling.

## Coverage Goals by Layer
- **Business Logic:** 80%+ unit test coverage. Focus on logic, not boilerplate.
- **API Layer:** 100% integration test coverage for endpoints.
- **UI:** E2E tests covering only the top 5-10 critical user flows. Do not aim for 100% UI automation coverage.

## Testing in CI/CD Pipeline Order
To optimize developer feedback loops, tests should run in order of speed and stability:
1. **Linting & Type Checking:** (Seconds) Every commit.
2. **Unit Tests:** (Seconds/Minutes) Every commit.
3. **Integration Tests:** (Minutes) Every Pull Request.
4. **E2E Tests:** (Minutes/Hours) On merge to main branch or nightly.
5. **Performance / Security:** Pre-release or nightly.

## Formulating a Test Strategy Document
When asked to create a strategy, formulate a document that defines:
1. What will be tested (Scope).
2. What will NOT be tested (Out of Scope).
3. The specific tools chosen.
4. The environments required.
5. How tests fit into the CI/CD pipeline.
