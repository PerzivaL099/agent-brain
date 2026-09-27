# Architecture Patterns Reference

## 1. Monolithic Architecture
A single, unified application where UI, business logic, and data access are housed together.
- **When to use:** Startups, MVP development, small teams, domains with low complexity.
- **Trade-offs:** 
  - *Pros:* Simple to develop, test, and deploy; straightforward debugging.
  - *Cons:* Scales poorly (must scale the whole app), tight coupling, slow build times as code grows.
- **Migration Path:** Evolve to a Modular Monolith, then slowly extract bounded contexts into Microservices.

## 2. Modular Monolith
A monolithic application structured internally into strictly separated, independent modules.
- **When to use:** Growing applications where domain complexity is increasing, but operational overhead of microservices is not justified.
- **Trade-offs:**
  - *Pros:* Balances simplicity of monolith deployment with clean, separated code boundaries.
  - *Cons:* Requires strong team discipline to maintain module boundaries (preventing "spaghetti" code).

## 3. Microservices Architecture
Application composed of small, independent services communicating over APIs.
- **When to use:** Large-scale applications, multiple autonomous development teams, differing scalability needs per component.
- **Trade-offs:**
  - *Pros:* Independent deployment, technology diversity, fault isolation, targeted scaling.
  - *Cons:* High operational complexity, distributed transactions, difficult debugging, network latency.

## 4. Serverless Architecture
Application logic executed in stateless compute containers managed by a cloud provider (e.g., AWS Lambda, Azure Functions).
- **When to use:** Spiky or highly variable workloads, event-driven processes, rapid prototyping, optimizing for compute cost.
- **Trade-offs:**
  - *Pros:* Zero infrastructure management, auto-scaling, pay-per-execution.
  - *Cons:* Vendor lock-in, cold starts (latency), difficult local testing.

## 5. Event-Driven Architecture
Components communicate by producing and consuming events, often using an event broker (e.g., Kafka, RabbitMQ).
- **When to use:** Highly decoupled systems, real-time analytics, complex asynchronous workflows.
- **Trade-offs:**
  - *Pros:* High scalability, loose coupling, resilience (publishers don't care if consumers are down).
  - *Cons:* Eventual consistency, complex error handling, trace routing is difficult.
