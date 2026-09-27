# Error Handling Comprehensive Guide

Robust error handling is critical for stability, security, and developer experience.

## Error Taxonomy

Categorize errors to handle them appropriately:
1. **User/Client Errors (4xx):** Invalid input, unauthorized access, requesting non-existent resources.
   - *Action:* Return a clear message to the client. Do not retry or crash.
2. **System/Environment Errors (5xx):** Database unreachable, network timeout, third-party API down.
   - *Action:* Retry (if transient), circuit break, alert operations, return a generic "Service Unavailable" to the user.
3. **Programmer Errors (Bugs):** Null pointer exceptions, type errors, out-of-bounds arrays.
   - *Action:* Crash (Fail Fast), generate a stack trace, alert developers immediately.

## Error Propagation Patterns

**Throwing Exceptions (Standard):**
Use exceptions for exceptional circumstances. Don't use them for normal control flow.

**Result Types / Either Monad (Functional Pattern):**
In languages that support it (Rust, Go, or TS via libraries), returning an Error as a value forces the caller to explicitly handle it.
```typescript
// Prefer this:
function findUser(id: string): Result<User, NotFoundError>
// Over this:
function findUser(id: string): User // implicit throw
```

## Retry Logic

For transient errors (e.g., network timeouts, rate limits):
- Implement an **Exponential Backoff** strategy.
- Add **Jitter** (randomness) to avoid thundering herd problems.
- Limit the maximum number of retries.

## Circuit Breakers

When depending on external services, protect your system from cascading failures using a Circuit Breaker pattern:
- **Closed:** Normal operation. Requests pass through.
- **Open:** The external service is failing. Fail immediately without making requests.
- **Half-Open:** Allow a test request through to see if the service has recovered.

## Logging Strategy

When handling an error, log the context:
- ❌ Bad: `log.error("Failed to process order")`
- ✅ Good: `log.error("Failed to process order", { orderId: 123, userId: 456, error: err })`

**Rule of Thumb:** Catch errors at the boundaries (e.g., Controllers, Background Jobs) to log them and format the response. Avoid catching and logging at every intermediate level, which leads to duplicate log entries.
