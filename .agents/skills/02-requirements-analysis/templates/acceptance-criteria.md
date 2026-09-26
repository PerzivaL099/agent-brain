# Acceptance Criteria 

**User Story:** [Link to User Story or Title]

## Scenario 1: [Happy Path / Primary Flow]
- **Given** [e.g., the user is logged in and on the dashboard]
- **When** [e.g., they click 'Create New Project']
- **Then** [e.g., a modal should open with form fields for Name and Description]

## Scenario 2: [Alternate Flow / Edge Case]
- **Given** [e.g., the user is logged in but lacks admin privileges]
- **When** [e.g., they attempt to access the admin settings URL directly]
- **Then** [e.g., they are redirected to the home page with a 403 error message]

## Scenario 3: [Error State / Validation]
- **Given** [e.g., the user is filling out the 'Create New Project' form]
- **When** [e.g., they submit the form with the Name field empty]
- **Then** [e.g., the submission is blocked and a "Name is required" inline error is shown]
