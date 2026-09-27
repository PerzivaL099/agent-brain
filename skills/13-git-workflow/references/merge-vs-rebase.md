# Merge vs. Rebase

Understanding how to integrate changes is crucial for maintaining a healthy Git repository.

## The Golden Rule of Rebasing
**Never rebase public history.** If a branch has been pushed and someone else might have based work on it, do not rebase it. Only rebase your own local, private branches or branches where you are the sole contributor and force-pushing is expected (like a personal feature PR).

## 1. Squash and Merge (Default for PRs)
- **What it does**: Takes all commits in the feature branch, squashes them into one single commit, and appends it to `main`.
- **When to use**: Merging feature branches into `main`.
- **Pros**: Keeps the `main` history incredibly clean (one commit per feature/bugfix).
- **Cons**: You lose the granular, step-by-step history of how the feature was developed.

## 2. Rebase and Merge
- **What it does**: Takes the commits from the feature branch, reapplies them one by one on top of `main`.
- **When to use**: When your PR consists of multiple, logically distinct, highly valuable commits that should be preserved individually in `main`.
- **Pros**: Clean, linear history without cluttered merge commits.
- **Cons**: Can be difficult to resolve conflicts if the branch is far behind.

## 3. Standard Merge (Merge Commit)
- **What it does**: Creates a new commit that ties the two histories together.
- **When to use**: Merging long-lived shared branches (e.g., merging `release` into `main` in Git Flow).
- **Pros**: Completely non-destructive. Preserves exact history.
- **Cons**: Creates a "train track" history that is difficult to read.

## Interactive Rebase (`git rebase -i`)
Use interactive rebase to clean up your local history before pushing your PR:
- `pick`: Use the commit.
- `reword`: Change the commit message.
- `squash`: Combine this commit with the previous one.
- `drop`: Remove the commit entirely.
