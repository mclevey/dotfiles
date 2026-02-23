Review the specified file(s) for quality issues. Check each category and report only actual problems found — do not report categories with no issues.

## Categories

**Correctness**: Logic errors, off-by-one, wrong variable, unhandled edge cases.

**Pandas anti-patterns**: Any use of `.iterrows()`, `.itertuples()`, or `.apply()` with row-wise lambdas. Suggest the vectorized replacement.

**Type safety**: Missing type annotations on function signatures. Missing return types. Use of `Any` where a specific type is possible.

**Documentation**: Functions missing docstrings. Docstrings missing Parameters/Returns sections. Stale docstrings that don't match the current signature.

**Readability**: Overly complex expressions that could be simplified. Magic numbers. Unclear variable names. Functions longer than ~50 lines that should be split.

**Notebook quality** (for .qmd/.ipynb): Excessive print statements that should be markdown narrative. Missing markdown cells between code cells. Code cells doing too many things.

## Output

For each issue found:

- File and line number
- Category
- What's wrong (1 sentence)
- Suggested fix (code snippet if non-obvious)

End with a 1-2 sentence summary of overall quality.
