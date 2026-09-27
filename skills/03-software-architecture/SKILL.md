---
name: software-architecture
description: |-
  Use this skill when designing the technical architecture of a system. Activates when starting a new project (after requirements), when making major technical decisions, when the user says 'design the system', 'architect this', or 'how should we structure this'. Teaches the agent to evaluate architecture patterns, create system diagrams, design APIs and data models, write Architecture Decision Records (ADRs), and produce a comprehensive System Design Document.
---

# Software Architecture

## Overview
Software architecture transforms analyzed requirements into a structural blueprint. It defines components, their interactions, data flows, and technological choices. This skill equips the agent to make and document sound architectural decisions.

## Architecture Process
1. **Understand Constraints**: Review requirements, budget, team skills, and timelines.
2. **Explore Options**: Evaluate potential patterns and technologies.
3. **Decide**: Select the best fit based on trade-offs.
4. **Document**: Record decisions via ADRs and create the System Design Document.

## The C4 Model (Context, Container, Component, Code)
Use the C4 model to document architecture hierarchically.
- **Level 1: System Context**: Shows the software system and how it interacts with users and other systems.
- **Level 2: Container**: Shows the high-level technical architecture (apps, databases, microservices).
- **Level 3: Component**: Zooms into a specific container to show its internal components.
- **Level 4: Code**: (Rarely needed) UML class diagrams for specific complex logic.

*Example Context Diagram (Mermaid):*
```mermaid
C4Context
  Person(user, "User", "A user of the system")
  System(system, "Software System", "The system being designed")
  SystemExt(ext, "External System", "A third-party dependency")
  Rel(user, system, "Uses")
  Rel(system, ext, "Sends data to")
```

## Architecture Pattern Catalog
- **Monolith**: Single deployable unit. Best for early stage, simple domains, small teams.
- **Modular Monolith**: Single deployment, but strictly separated internal modules. Good for growing complexity before going microservices.
- **Microservices**: Independently deployable services bounded by domain. Best for large-scale, multiple autonomous teams.
- **Serverless**: Event-driven execution on managed infra (e.g., AWS Lambda). Best for variable workloads, cost optimization.
- **Event-Driven**: Services communicate via events/messages. Best for asynchronous processing and high decoupling.

## API Design Principles
- Follow RESTful conventions (nouns for resources, HTTP verbs for actions).
- Always version APIs (e.g., `/api/v1/users`).
- Use standard HTTP status codes.
- Design consistent, structured error responses.

## Data Modeling Principles
- Choose the right DB (Relational vs. NoSQL) based on data structure and query patterns.
- Apply normalization to reduce redundancy, denormalize for read performance if necessary.
- Plan indexing strategies for common queries.

## Architecture Decision Records (ADRs)
Whenever a significant architectural decision is made (e.g., "Choosing PostgreSQL over MongoDB"), document it using an ADR. This captures the context, decision, and consequences for future reference.

## Checklists
- **Security**: Authentication (OAuth/JWT), authorization (RBAC), data encryption (in transit/at rest), input validation, CORS.
- **Scalability**: Stateless services, caching strategies, read replicas, async queues. *(See [Scalability Checklist](./references/scalability-checklist.md))*

## Expected Output
- System Design Document covering Context, Containers, Data Models, and APIs.
- ADRs for major technical choices.
