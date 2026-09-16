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
4. implement
5. tdd
6. code-review

## Uncle Bob's process is an Agentic BDD with enforced QA steps

1. **Specifier** takes a human-written requirement document and translates to scenarios written in gherkin (high-level acceptance tests) and QA procedure implementing the system test (i.e. tests using the UI).
2. **Coder** implements the stories described in gherkin and implements the test scenarios together with unit tests. Its main focus is functionality, not quality.
3. **Cleaner** use static code analysis tools like CRAP score, and code-review to improve the code quality.
4. **Hardener** runs the mutation testing until there is 100% code coverage is achieved. Could be a long process.
5. **QA Agent** takes a QA procedure (system tests) and implements it as an executable script. The result must be deterministic.
6. **Human reviewer** use architecture viewer to analyze the architecture (dependencies, boundaries, interfaces) and identify potential issues or areas for improvement. This is written into a specification (not gherkin) that the agent cannot violate.

Notes to myself

- Designing clear the **trajectory** of the context window keeps the coding agent focused on the task at hand, i.e. it will not get confused to lose direction. 

- **Deep modules* is good for agentic coding, intuitive public interface with complex functionalities
