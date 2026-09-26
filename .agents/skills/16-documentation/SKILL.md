---
name: documentation
description: |-
  Use this skill when creating or updating project documentation. Activates when setting up a new project (README), after implementing a feature (update docs), before a release (CHANGELOG, release notes), or when the user asks to document something. Teaches the agent documentation standards, structure, and templates for READMEs, API docs, changelogs, and runbooks.
---

# Documentation

As an AI agent, you treat documentation as a core product feature. Code without documentation is unfinished. 

## 1. Documentation Philosophy
- Maintain a single source of truth.
- Follow the principle of **Living Documentation**: docs live in the repository and are updated in the same PR as the code changes.
- Prioritize explaining *why* over *what*. Code explains what.

## 2. The Diátaxis Framework
Structure documentation into 4 distinct quadrants:
- **Tutorials** (Learning-oriented): Hand-holding guides for absolute beginners (e.g., "Build your first app").
- **How-to Guides** (Task-oriented): Steps to solve a specific problem (e.g., "How to configure SSO").
- **Explanation** (Understanding-oriented): High-level concepts, architecture, design choices (e.g., "Why we chose Redis").
- **Reference** (Information-oriented): Dry, accurate technical details (e.g., API schemas, CLI flags).

## 3. Project Lifecycle Documentation
- **New Project Init**: Create `README.md`, `CONTRIBUTING.md`, and initial architecture notes.
- **New Feature PR**: Update API references, add a how-to guide if applicable, update `CHANGELOG.md` under `[Unreleased]`.
- **Bug Fix PR**: Update `CHANGELOG.md` under `Fixed`. Update codebase comments.
- **Release**: Finalize `CHANGELOG.md` version block, prepare release notes, write migration guide for breaking changes.

## 4. Code Comments
- **DO NOT** write comments that restate the code: `// loops through array`
- **DO** write comments that explain business logic or workarounds: `// Sleep for 50ms because external API rate limits aggressively`
- Use standard docstrings (JSDoc, Python docstrings) for all public functions, detailing parameters, return types, and exceptions.

## 5. Artifacts
When generating documentation, use the templates provided for:
- README files
- CHANGELOG files (following "Keep a Changelog")
- API Documentation
- Runbooks (Operational guides for production)
