# Review Protocol
<!-- last_reviewed: 2026-07-11 -->

> Run this checklist before approving or merging any pull request across TylrDn repos.

---

## Pre-Merge Checklist

### Scope
- [ ] PR does exactly what the title says — no scope creep
- [ ] No unrelated files modified
- [ ] No commented-out or dead code added

### Commits
- [ ] All commits follow Conventional Commits format (`feat:`, `fix:`, `chore:`, `docs:`, etc.)
- [ ] No `WIP`, `temp`, or `fixup` commits in the final branch (squash if needed)
- [ ] Commit messages are imperative and present-tense ("add auth" not "added auth")

### Code Quality
- [ ] No hardcoded secrets, tokens, or credentials
- [ ] No `console.log` / debug statements left in production paths
- [ ] Error cases are handled (no silent failures)
- [ ] New dependencies are justified and vetted

### Tests & CI
- [ ] CI passes (lint + tests green)
- [ ] New functionality has corresponding tests (or PR notes why tests are omitted)
- [ ] No existing tests deleted without explanation

### Documentation
- [ ] README or relevant docs updated if the change affects usage or setup
- [ ] session-log entry created if this is an agent-driven session

### Security
- [ ] No new attack surface introduced (open redirects, unvalidated inputs, etc.)
- [ ] No sensitive data in logs or error messages
- [ ] Dependencies checked for known CVEs if newly added

---

## Merge Rules (TylrDn/CODE)

- Squash merge preferred for feature branches
- Merge commit preferred for releases or integration branches
- Delete the branch after merge

---

> Source of truth: TylrDn/CODE/agent/review-protocol.md — sync manually when updated.
