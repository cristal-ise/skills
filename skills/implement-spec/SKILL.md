---
name: implement-spec
description: "Implement the result of /to-spec and /to-tickets in code."
disable-model-invocation: true
---

You have been provided a spec. This spec should have tickets associated with it, describing how to implement the spec.

The issue tracker should have been provided to you. If not, tell the user to run `/setup-matt-pocock-skills`.

The goal is the entire spec implemented on a single **integration branch**, with every ticket resolved the way the issue tracker closes work.

The tickets are not a list of steps. They are a **task graph** with blocking relationships between them. This means there is always a **frontier** of tickets which are ready to be grabbed.

Communication to and from subagents should be sparse. Communicate primarily through **context pointers**: to the spec, tickets, research notes, and previous commits. Don't duplicate information already available via pointers.

Run `/implement-ticket` for each ticket in its own worktree, one at a time.

## Steps

1. Read the spec and tickets to understand the task graph.

2. Use an **exploration subagent** to conduct any exploration required by the tickets - relevant codebase files or external documentation. The exploration subagent saves its markdown notes in the `docs/explorations` directory, accessible by all future runs. This lets `/implement-ticket` focus on implementation rather than exploration.

3. Create the integration branch named after the spec.

4. Pick one ticket from the frontier, create a worktree on a branch named after the ticket, based on the integration branch. Run `/implement-ticket` in that worktree.

5. Once the `/implement-ticket` run completes, merge its branch to the integration branch with a **merger subagent**.

6. If the issue tracker closes work through PRs, or the user asks for one, check if a draft PR already exists. If not, open one after the first merge and instruct the PR to close the spec and its tickets.

7. Resolve the ticket the way the issue tracker closes work.

8. If the **frontier** still has available tickets, go back to step 4.

9. If a draft PR exists, mark it ready for review. Otherwise, resolve each ticket the way the issue tracker closes work, and report the integration branch.

10. Clean up all ticket worktrees.
