# Fish Shell Config – Copilot Instructions

## Config load order

```
config.fish  →  cachyos-config.fish  →  conf.d/done.fish
```

`config.fish` is the fish entry point. It sources `cachyos-config.fish`, which is the main file for all aliases, functions, environment setup, and PATH configuration. `conf.d/done.fish` is the vendored [done](https://github.com/franciscolourenco/done) plugin, sourced explicitly from `cachyos-config.fish`.

## Key conventions

- **Aliases and functions** live in `cachyos-config.fish`. Add new ones there.
- **Autoloaded functions** can alternatively be placed as individual files in `functions/<name>.fish` — fish will load them on first call.
- **Completions** go in `completions/<command>.fish`.
- **Universal variables** are managed by fish via `set -U` and persisted automatically to `fish_variables`. Do not edit `fish_variables` by hand.
- `fish_add_path` is used to extend `$PATH`; avoid duplicating paths already added.

## `done` plugin configuration

The `done` plugin fires a desktop notification when a command runs longer than `$__done_min_cmd_duration` (currently 10 000 ms). Settings are universal variables:

```fish
set -U __done_min_cmd_duration 10000          # ms threshold
set -U __done_notification_urgency_level low  # notify-send urgency
```

## External tools required

| Tool | Purpose |
|------|---------|
| `fastfetch` | Shell greeting (`fish_greeting`) |
| `bat` | Man page pager (`MANPAGER`) |
| `eza` | `ls`, `la`, `ll`, `lt`, `l.` aliases |
| `brew` | `update` alias (`brew upgrade && brew cleanup`) |

## Greeting

The greeting is defined in `cachyos-config.fish` as `function fish_greeting`. A commented-out override stub exists in `config.fish` for disabling or replacing it without editing the main file.
