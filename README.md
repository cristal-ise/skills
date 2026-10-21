# Skills for CRISTAL-iSE

This repository contains
- the skills required to develop description-driven applications based on the CRISTAL-iSE framework
- the tools to develop those skills
- the description of the agentic development flow designed to develop the CRISTAL-iSE framework.

Entirely based on the engineering, productivity skills of Matt Pocock with extra quality steps proposed by Uncle Bob.

https://github.com/mattpocock/skills
https://github.com/unclebob/swarm-forge/blob/six-pack/README.md

## Main flow of skills triggered by the user

The main goal is to define the smallest possible spec to implement. The process below minimises human review by doing it after the spec was implemented. To keep the review quick and effective, it is important to keep the complexity of the spec low. Use /wayfinder if you are unsure how to define the required spec.

### Planning and design session

1. /wayfinder – optional
2. /grill-with-docs
3. /to-spec
4. /to-tickets

### Implementation session - implement-loop is still under development

1. /implement-loop spec-reference
2. /improve-codebase-architecture - create tickets from design review and link it with spec 
3. /implement-loop spec-reference
4. /retro – check the report and decide on the required actions.

## SKILL: implement-loop

Implements a full spec sequentially by resolving its tickets as a task graph. Creates a temporary integration branch, implements each ticket in its own worktree using `/implement-ticket`, merges each result back, and optionally opens a draft PR to track progress. Continues until all tickets are resolved, then cleans up all branches and worktrees.

## SKILL: implement-ticket

Implements a single ticket from the issue tracker. Fetches the ticket, uses TDD to implement, performs quality steps based on static analysis, coverage report and mutation testing, performs a code review and commits each step to its branch.

## Set up these skills for a new or existing repository

### First time
- `npx skills@latest add mattpocock/skills`
- `npx skills@latest add cristal-ise/skills`
- extend the build process with test coverage, static code analysis and mutation testing.
- prompt `/setup-matt-pocock-skills`
- run a prompt similar to this (setting up quality tools could be added to /setup-matt-pocock-skills):
    - `/writing-for-agents create docs/agents/quality.md for the usage of codenarc, jacoco and pitest, and reference it in AGENTS.md`

### Update
- `npx skills@latest update`
