---
name: wait-subagent
description: Spawn a subagent with user's message, wait for result, close it, return result.
disable-model-invocation: true
---

Split the first argument on comma to get name and timeout (format: /spawn-subagent `<name>,<timeout>` <message>). Do not deviate from these steps and execute the following steps in sequence. You must use a subagent.

1. `tools.agent.spawn({ agentName: <name>, message: <rest-of-prompt> })`
2. `tools.agent.wait({ agentName: <name>, timeoutSec: <timeout> })`
3. `tools.agent.close({ agentName: <name> })`
4. In case of timeout return the timeout message, stop execution and ask the user to retry otherwise return the waited result
