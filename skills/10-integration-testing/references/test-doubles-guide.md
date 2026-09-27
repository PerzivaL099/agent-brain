# Test Doubles in Integration Contexts

In unit testing, test doubles replace internal classes. In integration testing, test doubles replace *entire systems or infrastructure*.

## When to use Real vs. Test Doubles

| Dependency | Recommendation | Why? |
| :--- | :--- | :--- |
| Database (SQL/NoSQL) | **Real** (via TestContainers) | In-memory DBs often have different syntax or missing features compared to production DBs. |
| Message Broker (Kafka/RabbitMQ) | **Real** (via TestContainers) | Exact behavior of topics, partitions, and acks is critical to test. |
| Cache (Redis) | **Real** | Lightweight enough that running a real instance is fast. |
| Internal Microservice | **Mock/Stub** | Brittle to stand up the entire architecture. Use Contract Testing instead. |
| Third-Party APIs (Stripe, Twilio) | **Mock** (via WireMock) | Prevent hitting rate limits, incurring costs, or polluting third-party sandboxes. |

## 1. Test Containers
TestContainers is a library that provides lightweight, throwaway instances of common databases, Selenium web browsers, or anything else that can run in a Docker container.
- **Pattern:** Start container before test suite -> App connects to container -> Stop container after suite.

## 2. WireMock Patterns (External API Mocking)
WireMock simulates HTTP-based APIs.
- **Stubbing:** Define what response should be returned for a specific HTTP request.
- **Verification:** Assert that the application made the correct HTTP request (headers, body, method) to the external service.
- **Fault Injection:** Simulate external service failures (e.g., 500 errors, delayed responses, dropped connections) to ensure your app handles timeouts gracefully.

## 3. Database Transaction Rollback Pattern
The most efficient way to isolate DB tests.
- **Begin** transaction before each test.
- **Execute** test code (writes to DB).
- **Assert** against DB state.
- **Rollback** transaction after each test. (The DB returns to its exact previous state instantly).

## 4. Seeding Strategies
When a test requires pre-existing data:
- **Global Seed:** Run once before the test suite for static reference data (e.g., Country codes).
- **Test-Specific Seed:** Insert data in the `Arrange` phase of the test and clean it up afterward. Prevents tests from relying on each other's data.
