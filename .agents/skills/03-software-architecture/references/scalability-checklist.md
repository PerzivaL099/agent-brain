# Scalability Checklist

Use this checklist when designing systems meant to handle high loads or rapid growth.

## 1. Scaling Strategy
- [ ] **Horizontal Scaling (Scaling Out):** Can instances of the application be added dynamically behind a load balancer?
- [ ] **Vertical Scaling (Scaling Up):** Are there hard limits on CPU/RAM that require scaling up a single machine? (Avoid if possible).
- [ ] **Statelessness:** Are application servers stateless? (User sessions should be stored in a distributed cache like Redis, not in memory).

## 2. Database Optimization
- [ ] **Read/Write Splitting:** Are reads directed to replica databases and writes to a master?
- [ ] **Indexing:** Are appropriate indexes applied to frequently queried columns?
- [ ] **Connection Pooling:** Is a connection pooler (e.g., PgBouncer) used to manage database connections?
- [ ] **Sharding/Partitioning:** Is there a strategy to partition data across multiple databases if vertical scaling hits a limit?

## 3. Caching
- [ ] **CDN (Content Delivery Network):** Are static assets (images, JS, CSS) served via CDN (e.g., Cloudflare, CloudFront)?
- [ ] **Application Caching:** Are expensive database queries cached (e.g., using Redis or Memcached)?
- [ ] **Cache Invalidation:** Is there a clear strategy for invalidating or expiring stale cache data?

## 4. Asynchronous Processing
- [ ] **Background Jobs:** Are long-running tasks (e.g., email sending, report generation) offloaded to background workers (e.g., Celery, Sidekiq)?
- [ ] **Message Queues:** Is a message broker (RabbitMQ, SQS, Kafka) used to decouple heavy processing from the web request cycle?

## 5. Network & Traffic Management
- [ ] **Load Balancing:** Is traffic distributed evenly across multiple servers?
- [ ] **Rate Limiting:** Are APIs protected from abuse and traffic spikes via rate limiting?
- [ ] **Circuit Breakers:** Do microservices implement circuit breakers to prevent cascading failures when a downstream service is slow or down?
