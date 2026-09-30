# Skills for CRISTAL-iSE

This repository contains
- the skills required to develop description-driven applications based on the CRISTAL-iSE framework
- the tools to develop those skills
- the description of the agentic development flow designed to develop the CRISTAL-iSE framework.

Entirely based on the engineering, productivity and in-progress skills of Matt Pocock: https://github.com/mattpocock/skills

## How to set up these skills for a new or existing repository

### First time
- `npx skills@latest add mattpocock/skills`
- `npx skills@latest add cristal-ise/skills`
- prompt `/setup-matt-pocock-skills`
- add test coverage, static code analysis and mutation testing to the project
- run a prompt similar to this: 
    - `/writing-for-agents create docs/agents/quality.md for the usage of codenarc, jacoco and pitest, and reference it in Agents.md`

### Update
- `npx skills@latest update`


--------------------------------------------------------------------

Notes to myself

- Designing clear the **trajectory** of the context window keeps the coding agent focused on the task at hand, i.e. it will not get confused to lose direction.
- **Deep modules* is good for agentic coding, intuitive public interface with complex functionalities


**Proposed complete process**

It is a combination of Matt Pocock's skills with minor adjustments, extended with Uncle Bob.

1. grill-with-docs or wayfinder
    - CONTEXT.md and ADRs are created/updated
2. to-spec
3. to-tickets
The steps below could be an AFK loop implementing all the tickets identified during step 1, but unfortunately, there is one manual step.
4. implement one ticket with tdd
5. code-review of the current branch
6. implement all the findings of code review and commit changes
7. resolve all the findings of static code analysis `./gradlew codenarcMain` and commit changes
    - see codeNarc rules and their configurations in `config/codenarc`
    - the size and cyclomatic complexity (CRAP metric does not work yet) thresholds might tigger major refactoring
    - in case of any major refactoring was done, check JaCoCO coverage (step 7)
8. use JaCoCo test coverage report `./gradlew clean test` to achieve +95% coverage  and commit changes
9. consolidate tests: find duplicates and common bases to reduce redundancy. Make sure to
    - meet all **Acceptance Criteria** specified in the Specification and in the actual Issue.
    - keep **Test coverage** of branch and instruction for each package
10. use PITest mutation testing report `./gradlew pitest` to achieve +95% coverage and commit changes
    - This could be a loop and/or use subagents
11. MANUAL: architecture review of the code and changes. Ask agent to produce diagrams (e.g. plantuml class, sequence, activity, ...) if needed to help to decide if there are any issues with the design or implementation. This requires experience to see the issue without reviewing the code changes line-by-line
12. if there are any issues with the design or implementation, create a plan to address them
    1. Implement the plan spawning a subagent for each step described in the plan. Commit changes
    2. Update ADRs and CONTEXT.md if needed and commit changes
    3. Go back to step 5
13. push to origin, create PR, run CI, if green merge to develop, run CI.
