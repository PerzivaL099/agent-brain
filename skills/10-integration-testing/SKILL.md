---
name: integration-testing
description: |-
  Use this skill when designing or writing integration tests that verify the interaction between multiple components, services, or external dependencies. Activates when implementing API endpoints, database operations, service-to-service communication, or when the user asks about integration tests. Teaches the agent to test boundaries, contracts, and data flows between components.
---

# Integration Testing Skill

## What Integration Tests Verify
Unlike unit tests that isolate a single function, integration tests verify how different pieces of the system work together. They focus on:
- Interactions between components.
- Data persistence to databases.
- Communication with external APIs or message queues.
- System configuration and wiring.

## Integration Test Categories
1. **API Integration Tests**: Testing HTTP endpoints from routing down to the database (often mocking third-party services).
2. **Database Integration Tests**: Verifying that repositories/DAOs write and read correctly from a real database.
3. **Service Integration Tests**: Testing communication between microservices.
4. **Third-Party Integration Tests**: Verifying contracts and interactions with external vendors (e.g., Stripe, SendGrid).

## Test Environment Setup
Integration tests require infrastructure. Use:
- **In-Memory Databases**: Fast, but may lack features of the production DB.
- **Test Containers**: Docker containers spun up specifically for tests (highly recommended for exact parity).
- **Mock Servers**: Tools like WireMock to simulate external API responses.
- **Test Fixtures**: Scripts to set the environment to a known state before testing.

## Contract Testing
For service-to-service communication, use Consumer-Driven Contracts (e.g., Pact).
- The Consumer defines the expected request/response format.
- The Provider runs tests against this contract to ensure compatibility.

## Data Isolation Strategies
Tests must not interfere with each other.
- **Transactions**: Start a DB transaction before the test, rollback after (fastest).
- **Cleanup**: Truncate tables between test suites.
- **Test-Specific Data**: Generate unique IDs or namespaces for data used in specific tests to avoid collisions during parallel execution.

## Real vs Mocked Dependencies
- **Use Real**: For your own databases, caches (Redis), and internal services when possible (via Test Containers).
- **Mock**: For third-party APIs (payment gateways, external emails) that cost money, have rate limits, or are non-deterministic.

## Integration Test Structure
1. **Setup**: Boot the app, start containers, seed the database.
2. **Execute**: Make the HTTP request or invoke the integration layer.
3. **Assert**: Verify the HTTP response, check the database state, check logs.
4. **Teardown**: Clean up created data, rollback transactions.

## Performance Considerations
Integration tests are significantly slower than unit tests.
- Parallelize execution where possible.
- Group tests that require the same expensive setup.

## Running in CI/CD
- Run on Pull Requests to prevent broken integrations from merging.
- Isolate them from unit tests in the pipeline (e.g., `npm run test:unit`, then `npm run test:integration`).
