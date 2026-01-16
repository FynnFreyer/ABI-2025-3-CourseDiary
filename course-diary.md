# Notes about Git

We have both local and remote repositories.
A repository consists of working directory, staging area and the repository proper.

## Concepts

### Commits

A commit is a bundled up set of changes.
It is uniquely identified by a [hash](https://wikipedia.org/wiki/Hash_function) and consists of following information:

- Author -- **who** did the change?
- Date -- **when** did the change occur?
- Patch -- **what** was changed?

## Commands

- `git status` -- shows changes to the working directory and the state of the staging area
- `git add` -- add changes to a file to the staging area
- `git pull` -- synchronize changes[^changes] **from** the remote
- `git restore` -- restore the work directory or staging area

[^changes]: Change means a ["commit"](#commits).
