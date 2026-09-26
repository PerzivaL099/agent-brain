# Pipeline Stage Design Template

Use this template when planning a new pipeline stage.

## Stage: [Stage Name, e.g., Integration Tests]

- **Purpose**: [What does this stage verify or build?]
- **Trigger/Prerequisites**: [What jobs must pass before this runs?]
- **Inputs Required**: 
  - [List env vars, e.g., STAGING_DB_URL]
  - [List artifacts, e.g., built frontend assets]
- **Commands Execute**: 
  ```bash
  [Command 1]
  [Command 2]
  ```
- **Success Criteria**: [What defines a pass? e.g., Exit code 0, Coverage > 80%]
- **Failure Action**: [What happens if it fails? e.g., Hard block PR, trigger rollback]
- **Estimated Execution Time**: [e.g., 2-3 minutes]
- **Caching Opportunities**: [e.g., Cache node_modules]
