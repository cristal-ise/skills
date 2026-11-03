# Quality Tools: <static analysis>, <coverage>, and <mutation testing>

Evidence-backed guidance for this repo's quality tools. Replace placeholders with values confirmed from build files, CI, or the user. Keep all three topic sections; for an absent tool, name it **Not configured** and omit unavailable configuration, tasks, commands, and reports.

## <Static analysis tool> (Static Analysis)

**Purpose**: <What the configured tool analyzes and why it is used.>

**Leading word**: **<word>** — <short phrase capturing the tool's role.>

### Configuration

- **Build plugin/tool**: <Plugin or tool name and version, when specified>
- **Configuration**: <Ruleset and relevant configuration files>
- **Failure behavior**: <Whether violations fail the build and any configured thresholds>

### Tasks

- `<task>` - <What it analyzes>

### Invocation

```bash
<exact command confirmed from the build or CI configuration>
```

### Reports

- **<Format>**: `<configured report path>`

## <Coverage tool> (Code Coverage)

**Purpose**: <What code or tests the tool measures.>

**Leading word**: **<word>** — <short phrase capturing the tool's role.>

### Configuration

- **Build plugin/tool**: <Plugin or tool name and version, when specified>
- **Report formats**: <Configured formats>
- **Integration and thresholds**: <Test-task integration and any enforced coverage rules>

### Tasks

- `<task>` - <What it generates or verifies>

### Reports

- **<Format>**: `<configured report path>`

### Invocation

```bash
<exact command confirmed from the build or CI configuration>
```

## <Mutation testing tool> (Mutation Testing)

**Purpose**: <How the tool evaluates whether tests detect injected changes.>

**Leading word**: **<word>** — <short phrase capturing the tool's role.>

### Configuration

- **Build plugin/tool**: <Plugin or tool name and version, when specified>
- **Scope and options**: <Configured source scope, filters, and report options>

### Tasks

- `<task>` - <What it tests>

### Reports

- **<Format>**: `<configured report path>`

### Invocation

```bash
<exact command confirmed from the build or CI configuration>
```

## Combined Quality Checks

```bash
<exact command that runs configured quality checks together, if one exists>
```

## When to Run

- **Static analysis**: <When it runs in local development or CI>
- **Coverage**: <When reports or coverage verification run>
- **Mutation testing**: <When it is expected to run>
