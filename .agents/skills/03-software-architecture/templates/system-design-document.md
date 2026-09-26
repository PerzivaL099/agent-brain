# System Design Document

**Project:** [Project Name]
**Author:** [Name]
**Date:** [YYYY-MM-DD]

## 1. Overview
[High-level summary of the system, its purpose, and the problem it solves.]

## 2. Goals & Non-Goals
### Goals
- [e.g., Support 10k concurrent users]
- [e.g., Provide REST APIs for mobile clients]
### Non-Goals (Out of Scope)
- [e.g., Offline support for mobile clients]
- [e.g., Real-time chat functionality]

## 3. System Context Diagram (C4 Level 1)
[Mermaid C4 Context Diagram]

## 4. Container Diagram (C4 Level 2)
[Mermaid C4 Container Diagram]
[Description of main containers: Web App, API Gateway, Microservices, Databases]

## 5. Component Descriptions
| Component | Responsibility | Tech Stack |
|-----------|----------------|------------|
| [Name]    | [What it does] | [e.g., Node.js, React] |

## 6. Data Model
[Provide an ER Diagram using Mermaid and/or describe key entities and relationships.]

## 7. API Design
[High-level overview of API architecture. Link to API Contract documents.]

## 8. Security Design
- **Authentication:** [e.g., OIDC via Auth0]
- **Authorization:** [e.g., RBAC managed in Database]
- **Data Protection:** [e.g., TLS 1.3, AES-256 for PII at rest]

## 9. Scalability & Resilience Plan
- [How the system scales under load]
- [Failure scenarios and mitigation strategies]

## 10. Open Questions
- [Unresolved architectural concerns]
