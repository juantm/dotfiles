# .zprofile - Sourced for login shells
# Login-specific initialization

# Pyenv: add shims to PATH for all login shells (fixes OMZP::pyenv "badly configured" warning)
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
[[ -d $PYENV_ROOT/bin ]] && eval "$(pyenv init --path)"

# macOS specific login initialization
if [[ "$(uname)" == "Darwin" ]]; then
    # Lazy load brew shellenv
    _lazy_brew_init() {
        if command -v brew >/dev/null 2>&1; then
            eval "$(brew shellenv)"
        fi
    }
    # Lazy load JIRA token
    _lazy_jira_token() {
        if command -v security >/dev/null 2>&1; then
            export JIRA_API_TOKEN=$(security find-generic-password -w -s 'jira-api-key' -a 'jetoro@falabella.cl' 2>/dev/null)
        fi
    }

    # Override brew command for lazy initialization
    brew() {
        unfunction brew
        _lazy_brew_init
        command brew "$@"
    }

    # Override jira command for lazy token loading
    jira() {
        unfunction jira
        _lazy_jira_token
        command jira "$@"
    }

    # Load Datadog environment if present
    if [[ -f ~/.dd_env ]]; then
        source ~/.dd_env
    fi
fi