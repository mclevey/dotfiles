# Global Context

## About Me

John McLevey. Professor and Head of Sociology and Criminology at Memorial
University of Newfoundland. My work spans leadership, teaching, research, and
software development. I use Claude Code daily across all of these.

## Coding Standards

### Python (primary language)

- **Pandas**: Always use vectorized operations. Never use `.iterrows()`,
  `.itertuples()`, or `.apply()` with row-wise lambdas. Use vectorized
  string methods, `np.where`, `np.select`, boolean indexing, and `groupby`
  with built-in aggregations. If I ask you to write pandas code and you
  reach for iteration, stop and find the vectorized approach.
- **Type hints**: Every function and method gets full type annotations.
  Use modern syntax (`X | None` not `Optional[X]`, `list[str]` not
  `List[str]`). Use `collections.abc` for abstract types.
- **Docstrings**: NumPy style for research/data/scientific code. Google
  style for web apps, APIs, utilities. Always include Parameters, Returns,
  and Raises sections. Add Examples for non-obvious functions.
- **Style**: Ruff for formatting and linting. Target Python 3.11+.
  Prefer `pathlib.Path` over `os.path`. Prefer f-strings.
  Prefer functional patterns where they improve clarity.
- **Notebook Formats and Execution**: I do not write native Jupyter notebooks
  (e.g., `.ipynb` files). I write Quarto notebooks (`.qmd`) and often install
  a kernel into a pixi environment and then run the Quarto cells interactively
  in my IDE (Cursor, sometimes VS Code).
- **Notebooks**: Use narrative markdown cells to explain analysis steps
  and interpret results. Do NOT fill notebooks with print statements —
  use proper display, markdown cells, and DataFrame rendering. A notebook
  should read like a document, not a log file.
- **Testing**: pytest. Test behavior, not implementation.
- **Environments**: I use pixi (preferred) and sometimes poetry. Know both.
- **Quarto and Typst**: I use Quarto for almost everything, and often Typst for PDFs.

## Preferred Python Packages

- PyMC or Bambi with Arviz for Bayesian models (preferred)
- Statsmodels or sklearn for Frequentist models (when necessary or requested)
- graph-tool for network analysis with networkx as a secondary choice
- spacy for standard NLP work over NLTK and other packages

### Other Languages

- Python unless I specifically request R or some other language
- Quarto (.qmd) with Beamer for slides, custom LaTeX templates
- Typst (.typ) for newer documents
- HTML/CSS/JS for web projects

### Error Handling in Analytical Code

In data collection, analysis, and modeling code: let errors surface.
Do not wrap operations in try/except blocks that silently catch and
continue. If data is malformed, missing, or unexpected, I want to
know immediately — not discover it downstream in wrong results.

Exceptions to this:

- Web scraping and API calls: retry logic and error handling are fine
- Data loaders that process many files: log failures, continue, report loudly
- CLI tools and user-facing code: handle errors gracefully, log, and report loudly

## My Machines

- **macOS (ARM64)**: Primary development machine. Pixi, Homebrew, Ghostty.
- **Linux workstation (x86_64, NVIDIA 3090)**: Heavy compute — PyMC sampling,
  network analysis with graph-tool, GPU-accelerated work. Accessed via SSH.
  Pixi environments here may differ from macOS (platform-specific deps) but the
  Pixi files SHOULD adapt based on the system you are on.

## Writing Standards

- Active voice, concise, no filler
- Never use: "comprehensive", "delve", "utilize", "facilitate",
  "leverage", "in terms of", "it's important to note that"
- No em dashes — restructure the sentence instead
- No emojis in professional writing
- Vary sentence length. Short sentences for emphasis.
  Longer ones for complex ideas that need room to breathe.
- When editing my writing: preserve my voice, suggest don't rewrite
  unless I ask for a rewrite

### Genre-Specific

- **Academic writing**: Rigorous but accessible. Follow discipline
  conventions. Proper citations. No hedging without reason.
- **Administrative writing**: Direct, action-oriented, respect people's
  time. State what's needed, by when, and why.
- **Teaching materials**: Clear, scaffolded, encouraging without being
  patronizing. Concrete examples from social science.

## Communication Preferences

### Email Styles (I will tell you who I'm writing to)

- **Default**: Professional, warm, confident. Clear about what I need.
  Display leadership without being overbearing.
- **Careful management mode**: For sensitive colleagues (I'll say when).
  Blunt, boring, concise. Share minimal information. No warmth,
  no elaboration, just facts and next steps.

## Tool Preferences

- **Package management**: pixi (preferred), poetry, conda
- **Git**: Conventional commits. Small atomic commits. Meaningful messages.
  `git pull --rebase`. Branch naming: `feature/`, `fix/`, `docs/`
- **Editor**: Neovim (NvChad), also use Cursor
- **Terminal**: Ghostty, tmux, starship prompt
- **Shell**: zsh with eza, bat, zoxide, ripgrep, fd
- **Documents**: Quarto for most things, Typst for newer work,
  occasionally need .docx output for admin

## Work Context

- **Research**: Computational social science, network analysis,
  Bayesian methods, text analysis. Python packages, data pipelines,
  statistical modeling with PyMC/Bambi/ArviZ.
- **Teaching**: Quantitative research methods (undergrad and grad),
  computational social science, data science. Currently writing a
  textbook on quantitative research methods.
- **Administration**: Department head responsibilities — faculty
  management, curriculum, budgets, committee oversight, gen-ed proposals,
  student experience initiatives, self-study/accreditation.
- **Key project**: unicore — Python package for analyzing academic data
  from Memorial's Humanities and Social Sciences programs.

## How I Want Claude Code to Work

- Don't over-explain. If I ask for code, write the code. If I ask for
  a plan, give me the plan. Match your verbosity to the task.
- When I give terse instructions, don't ask for clarification on things
  you can reasonably infer. Just do the work and flag assumptions.
- If you're going to make multiple files or a complex change, outline
  the plan first so I can redirect before you burn tokens.
- When I say "finish the work" or "continue", pick up exactly where
  you left off. Don't recap what you already did.
- If something is genuinely uncertain or risky, say so clearly and
  concisely. Don't bury it in a wall of text.
