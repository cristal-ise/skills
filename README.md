# Skills for CRISTAL-iSE

This repository contains
- the skills required to develop description-driven applications based on the CRISTAL-iSE framework
- the tools to develop those skills
- the description of the agentic development flow designed to develop the CRISTAL-iSE framework.

Based on the engineering, productivity and in-progress skills of Matt Pocock: https://github.com/mattpocock/skills


## Matt Pocock's process is an Agentic TDD

1. grill-with-docs or wayfinder
2. to-spec
3. to-tickets
4. implement with tdd
5. code-review

## Uncle Bob's process is an Agentic BDD with enforced QA steps

1. **Specifier** takes a human-written requirement document and translates to scenarios written in gherkin (high-level acceptance tests) and QA procedure implementing the system test (i.e. tests using the UI).
2. **Coder** implements the stories described in gherkin and implements the test scenarios together with unit tests. Its main focus is functionality, not quality.
3. **Cleaner** use static code analysis tools like CRAP score, and code-review to improve the code quality.
4. **Hardener** runs the mutation testing until there is 100% code coverage is achieved. Could be a long process.
5. **QA Agent** takes a QA procedure (system tests) and implements it as an executable script. The result must be deterministic.
6. **Human reviewer** use architecture viewer to analyse the architecture (dependencies, boundaries, interfaces) and identify potential issues or areas for improvement. This is written into a specification (not gherkin) that the agent cannot violate.

Notes to myself

- Designing clear the **trajectory** of the context window keeps the coding agent focused on the task at hand, i.e. it will not get confused to lose direction. 

- **Deep modules* is good for agentic coding, intuitive public interface with complex functionalities

## Final process
It is a combination of the processes described above. Steps 1–6 are the Matt Pocock's skills with minor adjustments, and steps 7–12 are the implementation of the strict QA process explained by Uncle Bob.

1. grill-with-docs or wayfinder
    - CONTEXT.md and ADRs are created/updated
2. to-spec
3. to-tickets
The steps below could be an AFK loop implementing all the tickets identified during step 1, but unfortunately, step 10 is manual (at the moment).
4. implement one ticket with tdd
5. code-review of the current branch
6. implement all the findings of code review and commit changes
7. use JaCoCo test coverage report `./gradlew clean test` to achieve +95% coverage and commit changes
8. resolve all the findings of static code analysis `./gradlew codenarcMain` and commit changes
    - see codeNarc rules and their configurations in `config/codenarc`
    - the size and cyclomatic complexity (CRAP metric does not work yet) thresholds might tigger major refactoring
    - in case of any major refactoring was done, check JaCoCO coverage (step 7)
9. use PITest mutation testing report `./gradlew pitest` to achieve +95% coverage and commit changes
    - This could be a loop and/or use subagents
10. MANUAL: architecture review of the code and changes. Ask agent to produce diagrams (e.g. plantuml class, sequence, activity, ...) if needed to help to decide if there are any issues with the design or implementation. This requires experience to see the issue without reviewing the code changes line-by-line
11. if there are any issues with the design or implementation, create a plan to address them
    1. Implement the plan spawning a subagent for each step described in the plan. Commit changes
    2. Update ADRs and CONTEXT.md if needed and commit changes
    3. Go back to step 5
12. push to origin, create PR, run CI, if green merge to develop, run CI.
