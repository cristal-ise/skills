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
5. /pr

## SKILL: implement-loop
Implements a full spec sequentially by resolving its tickets as a task graph. Creates a temporary integration branch, implements each ticket in its own worktree using `/implement-ticket`, merges each result back. Optionally, it opens a draft PR to track progress. Continues until all tickets are resolved, then cleans up all branches and worktrees.

It is based on the `/implement-spec` skill of Matt Pocock with the following changes:

1. The step with  **exploration subagent** was removed because it was too vague.
2. All references to subagents were removed to define an explicit, sequential loop to implement the spec replacing the implicit and concurrent loop based on the subagent behaviour. The main reasons for this change: 
   - In my view, skill should not define concurrent execution of tasks because it is not the right place to implement orchestration (check the skill documentation about merge conflicts).
   - Exploration, implementer, merger subagents were not defined.
3. It calls /implement-ticket instead of invoking the `implementer subagent` with /tdd.
4. /code-review is replaced by /improve-codebase-architecture because /code-review was already run in /implement-ticket. Also, /improve-codebase-architecture provides the missing quality step to finalise the implementation. 

## SKILL: implement-ticket
Implements a single ticket from the issue tracker. Fetches the ticket, uses TDD to implement, performs quality steps based on static analysis, coverage report, and mutation testing, performs a code review, and commits each step to its branch.

It is based on the /tdd and /code-review skills of Matt Pocock but extended with quality steps. /tdd is intentionally kept simple and focused on implementation over quality. That is important as it keeps the agent focused, but the next steps after /tdd should ensure quality. This approach is missing from Matt’s skills, but Uncle Bob talks a lot about those steps. That is why this skill has many steps to improve quality after /tdd.

## Set up these skills for a new or existing repository

### First time
- `npx skills@latest add mattpocock/skills`
- `npx skills@latest add cristal-ise/skills`
- the build process shall have toold for test coverage, static code analysis, and mutation testing.
- prompt `/setup-matt-pocock-skills`
- run a prompt similar to this (setting up quality tools could be added to /setup-matt-pocock-skills):
    - `/writing-for-agents create docs/agents/quality.md for the usage of codenarc, jacoco and pitest, and reference it in AGENTS.md`

### Update
- `npx skills@latest update`
