# E2E Test Data Setup Strategy

## 1. Data Requirements
List the exact data entities required for the E2E test suite to run.
- [e.g., Admin User, Standard User]
- [e.g., Product Catalog (at least 5 items)]

## 2. Factory/Seed Script Approach
How will this data be injected into the system?
- [ ] **Direct DB Injection:** Fast, but bypasses business logic.
- [ ] **API Seeding:** Slower, but guarantees data validity through application logic. (Recommended)
- [ ] **UI Seeding:** Very slow. Only use if no API exists.

*Implementation Details:* [Link to scripts or describe factory mechanisms]

## 3. Isolation Strategy
How do we ensure parallel tests don't corrupt each other's data?
- **Pattern:** Use randomized identifiers.
- *Example:* Instead of creating a user `test@test.com`, the script creates `test+<timestamp>@test.com`.

## 4. Cleanup Strategy
How is data removed after tests complete?
- [ ] Database Teardown (truncate tables)
- [ ] API Cleanup (delete endpoints)
- [ ] Sandboxed Environment (destroy entire DB container)

## 5. Sensitive Data Handling
- **Rule:** NEVER use production data in E2E testing environments.
- Use libraries like Faker.js to generate realistic PII (Names, Addresses) and generic test credit cards provided by payment gateways.
