# Conventional Commits Reference

The Conventional Commits specification provides a lightweight convention on top of commit messages, providing an easy set of rules for creating an explicit commit history.

## Format
```
<type>(<optional scope>): <description>

[optional body]

[optional footer(s)]
```

## Types

- **`feat`**: A new feature.
- **`fix`**: A bug fix.
- **`docs`**: Documentation only changes.
- **`style`**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc).
- **`refactor`**: A code change that neither fixes a bug nor adds a feature.
- **`perf`**: A code change that improves performance.
- **`test`**: Adding missing tests or correcting existing tests.
- **`build`**: Changes that affect the build system or external dependencies.
- **`ci`**: Changes to CI configuration files and scripts.
- **`chore`**: Other changes that don't modify src or test files.
- **`revert`**: Reverts a previous commit.

## Scope (Optional)

A scope may be provided to an commit's type, to provide additional contextual information. It must be a noun describing a section of the codebase surrounded by parenthesis.
Example: `feat(parser): add ability to parse arrays`

## Description

- Use the imperative, present tense: "change" not "changed" nor "changes".
- Don't capitalize the first letter.
- No dot (.) at the end.

## Breaking Changes

Any commit that introduces a breaking API change MUST contain a `!` after the type/scope, or include a `BREAKING CHANGE:` footer.

**Example 1 (Exclamation mark):**
`feat(api)!: remove v1 endpoints`

**Example 2 (Footer):**
```
feat: allow provided config object to extend other configs

BREAKING CHANGE: `extends` key in config file is now used for extending other config files
```

## Common Mistakes

- ❌ `fix: Fixed the login bug` (Uses past tense, capitalized) -> ✅ `fix: resolve login crash on invalid password`
- ❌ `Added new feature` (No type provided) -> ✅ `feat: add user profile page`
- ❌ `chore: update code` (Too vague) -> ✅ `refactor(auth): extract token validation logic`
