# Integration Test Plan Template

## 1. Component Under Test
**Name:** [Component/Service Name]
**Description:** [What does this integration do?]

## 2. Dependencies
List all internal and external dependencies involved in this integration.

| Dependency | Type | Strategy (Real/Mocked/Container) |
| :--- | :--- | :--- |
| [e.g., PostgreSQL] | Database | Test Container |
| [e.g., Stripe API] | External API | Mock Server (WireMock) |

## 3. Test Scenarios

| ID | Scenario | Input | Expected Output / State | Test Data Req. | Pass/Fail |
| :--- | :--- | :--- | :--- | :--- | :--- |
| IT-01 | [e.g., Successful User Creation] | [Valid Payload] | [201 Created, DB Row exists] | [None] | |
| IT-02 | [e.g., DB Constraint Violation] | [Duplicate Email] | [409 Conflict] | [Existing User] | |

## 4. Setup Requirements
- **Infrastructure:** [e.g., Docker required, specific ports available]
- **Environment Variables:** [e.g., TEST_DB_URL, MOCK_API_PORT]

## 5. Cleanup Strategy
- [e.g., Database transactions rolled back after each test]
- [e.g., Redis keys prefixed with test ID deleted in teardown]

## 6. CI/CD Integration
- **Pipeline Stage:** [e.g., Runs after Unit Tests in the PR build]
- **Parallelization:** [Yes/No, details on how data collisions are avoided]
