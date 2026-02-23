Review the staged changes with `git diff --cached`. Write a commit message following conventional commits format:

```
type(scope): concise description

Optional body explaining why, not what (the diff shows what).
```

Types: feat, fix, docs, style, refactor, test, chore, data, analysis
Scope: the primary file or module affected.

Rules:
- Subject line under 72 characters
- Imperative mood ("add feature" not "added feature")
- No period at the end of the subject line
- Body only if the "why" isn't obvious from the diff
- For data analysis changes, note which datasets or analyses are affected
- For multi-file changes, summarize the coherent change, don't list files

Review what's staged. If nothing is staged, show me what's available and ask what to include. Do not stage files without asking. If there are unrelated changes mixed together, suggest splitting into multiple commits and ask before proceeding.
