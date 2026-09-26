# The Testing Pyramid & Models

## 1. The Traditional Testing Pyramid (Mike Cohn)
- **Base (Unit):** Fast, cheap, highly isolated. The bulk of your tests.
- **Middle (Integration/Service):** Slower, test boundaries.
- **Top (UI/E2E):** Slow, expensive, fragile. Keep to an absolute minimum.

## 2. The Testing Trophy (Kent C. Dodds)
Geared towards modern frontend and full-stack web applications.
- **Static Analysis (Bottom):** ESLint, TypeScript. Catches silly errors before code runs.
- **Unit:** Pure logic testing.
- **Integration (Bulk):** The thickest part of the trophy. Test components and APIs as they interact. Provides the highest confidence-to-cost ratio.
- **E2E (Top):** Minimal smoke tests for the UI.

## 3. The Honeycomb Model (Microservices)
Geared towards distributed architectures.
- **Unit:** Minimal. Individual microservices often don't have enough complex standalone logic to warrant massive unit test suites.
- **Integration (Huge):** Focus heavily on Contract Testing and API boundary testing between services.
- **Integrated/E2E:** Minimal, as testing the entire mesh is usually too fragile.

## The "Ice Cream Cone" Anti-Pattern
An inverted pyramid.
- Massive amounts of manual UI testing or brittle automated E2E tests at the top.
- Very few integration tests.
- Almost no unit tests at the base.
**Why it's bad:** Feedback loops take hours or days. Bugs are found late. Fixing bugs is terrifying because there is no safety net of fast unit tests.

## Optimal Ratios
*As a general guideline:*
- Unit: ~70% of total test count
- Integration: ~20%
- E2E: ~10%
