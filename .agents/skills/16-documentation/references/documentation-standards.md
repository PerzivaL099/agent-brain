# Documentation Standards & Best Practices

## 1. Writing for Your Audience
A developer writing an API integration needs different information than an ops engineer diagnosing a crash.
- **Users**: Need How-Tos and Tutorials.
- **Contributors**: Need architecture diagrams and setup instructions.
- **Ops/SRE**: Need runbooks, metrics, and dependency graphs.

## 2. Docs-as-Code
Treat documentation exactly like code:
- Write in Markdown or AsciiDoc.
- Store in version control (same repo as code if possible).
- Require PR reviews for docs just like code.
- Run CI pipelines to check for broken links and lint markdown (e.g., `markdownlint`).

## 3. Automation Strategies
Documentation drift (docs not matching reality) is the biggest enemy.
- **API Docs**: Auto-generate from OpenAPI/Swagger definitions. Never hand-write API schemas if they can be generated from code/types.
- **CLI Docs**: Use tools to generate command-line references directly from `--help` outputs.
- **Doctest**: If a language supports it (like Python, Rust), execute your documentation code snippets in CI to ensure they actually work.

## 4. Documentation Debt
Just like technical debt, obsolete documentation actively harms a team by misleading them.
- If a feature is deleted, delete the docs.
- If a doc is known to be outdated but can't be fixed immediately, add a massive `> [!WARNING]` banner stating it is deprecated/out of date.
