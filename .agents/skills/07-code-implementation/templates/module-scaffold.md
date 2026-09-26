# Generic Module Scaffold

This is a technology-agnostic template for structuring a new logical module or feature domain. Regardless of the language (TypeScript, Python, Go, Java), organizing code this way ensures separation of concerns.

## Directory Structure
```
my-feature-module/
├── index (Entry Point)
├── types (Interfaces / Models)
├── core (Business Logic / Services)
├── data (Repositories / Data Access)
├── errors (Custom Error Types)
└── tests (Unit & Integration Tests)
```

## 1. Entry Point (`index`, `__init__`, `main`)
- **Purpose:** Exposes the public API of the module.
- **Rule:** Only export what external consumers need. Keep internal helper functions hidden.

## 2. Types / Interfaces
- **Purpose:** Defines the shape of data flowing in and out of the module.
- **Rule:** Include Request DTOs (Data Transfer Objects), Response DTOs, and internal Domain Models.

## 3. Core Logic / Services
- **Purpose:** Contains the pure business rules.
- **Rule:** Should NOT know about HTTP requests, CLI arguments, or specific database drivers. It relies on interfaces for data access.

## 4. Data / Repositories
- **Purpose:** Handles integration with databases, file systems, or external APIs.
- **Rule:** Implements interfaces defined by the core logic (Dependency Inversion).

## 5. Errors
- **Purpose:** Defines specific, strongly-typed errors for this module.
- **Rule:** Provide clear domain errors (e.g., `InsufficientFundsError`) rather than generic exceptions.

## 6. Tests
- **Purpose:** Validates the module's behavior.
- **Rule:** Keep tests co-located with the module to ensure it is self-contained and easily movable.
