# Skills for CRISTAL-iSE

This repository contains
- the skills required to develop description-driven applications based on the CRISTAL-iSE framework
- the tools to develop those skills
- the description of the agentic development flow designed to develop the CRISTAL-iSE framework.

Entirely based on the engineering, productivity skills of Matt Pocock with extra quality steps proposed by Uncle Bob.

https://github.com/mattpocock/skills
https://github.com/unclebob/swarm-forge/blob/six-pack/README.md

## Main flow of skills triggered by the user

The main purpose is to define the smallest possible spec to implement. The process below minimises human review by doing it after the spec was implemented. To keep the review quick and effective, it is important to keep the complexity of the spec low. Use /wayfinder if you are unsure how to define the required spec.

### Planning and design

1. /wayfinder – optional
2. /grill-with-docs
3. /to-spec
4. /to-tickets

### Implementation of spec

1. create the integration branch for spec
2. /implement-ticket 
3. manual merge to spec branch (this could be automated – see implement-spec of Matt)
4. goto step 2 for all reaming tickets (this could be automated – see implement-spec of Matt)
5. /codebase-design - create a ticket from design review and link it with spec
6. /implement-ticket
7. design review by the developer – Uncle Bob solution: https://github.com/unclebob/uml-viewer
   - Ask agent to produce diagrams i.e. plantuml class, sequence, activity. This requires experience to see the issue without reviewing the code changes line-by-line
8. if there are any issues with the design or implementation
    - ask agent to create a plan
    - create a ticket wth the plan and link it with the spec 
    - /implement-ticket
9. /retro – check the report and decide on the required actions. It requires that all steps above were executed in the same session

NOTE: it might be useful to do /retro after each /implement-ticket and save the report in docs/retro. This could make it possible to do the current step 9 without depending on the session history.

## SKILL: implement-ticket 

Implements a single ticket from the issue tracker. Fetches the ticket, uses TDD at pre-agreed seams, performs quality steps based on static analysis, coverage report and mutation testing, performs a code review and commits each step to the current branch.

## Set up these skills for a new or existing repository

### First time
- `npx skills@latest add mattpocock/skills`
- `npx skills@latest add cristal-ise/skills`
- extend the build process with test coverage, static code analysis and mutation testing.
- prompt `/setup-matt-pocock-skills`
- run a prompt similar to this: 
    - `/writing-for-agents create docs/agents/quality.md for the usage of codenarc, jacoco and pitest, and reference it in Agents.md`

### Update
- `npx skills@latest update`
