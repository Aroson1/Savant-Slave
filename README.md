# Savant-Slave

A set of Claude Code skills for everyday college things. It is packaged as a Claude Code
plugin marketplace, so anyone can add it and install the skills in a couple of commands.

## Skills

| Command | What it does |
|---------|--------------|
| `/college:assignment [path]` | Reads an assignment or lab brief, completes every task against real data, produces the deliverables, takes genuine screenshots with your name and roll number, writes the report, and assembles a clean submission folder. Pass a folder path, or leave it blank to use the current folder. |

More skills will be added over time under the same `college` plugin.

## Install

In Claude Code, add this marketplace and install the plugin:

```
/plugin marketplace add Aroson1/Savant-Slave
/plugin install college@savant-slave
/reload-plugins
```

Then run a skill, for example:

```
/college:assignment
/college:assignment ~/College/Lab-2
```

## Notes

- The `assignment` skill needs the student name and roll number. It will read them from
  your message or ask if it does not know them.
- The genuine screenshot step uses macOS `screencapture` with AppleScript. On Windows or
  Linux that part needs a different capture method, and the skill will ask you to capture
  and provide the screenshots instead.
- The skill uses Python and common data libraries when a task needs them and installs any
  missing packages at the user level.

## Repository layout

```
Savant-Slave/
├── .claude-plugin/
│   └── marketplace.json          # marketplace definition
└── plugins/
    └── college/                  # the "college" plugin
        ├── .claude-plugin/
        │   └── plugin.json       # plugin manifest
        └── skills/
            └── assignment/       # the /college:assignment skill
                ├── SKILL.md
                └── scripts/
```

## Adding a new skill

1. Create `plugins/college/skills/<skill-name>/SKILL.md` with the skill instructions.
2. Put any helper files in that skill's folder and reference them with
   `${CLAUDE_SKILL_DIR}` from `SKILL.md`.
3. Commit and push. Skills are discovered automatically from the `skills/` folder, so the
   manifests do not need to change.
