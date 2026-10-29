
. "$HOME/.local/bin/env"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi

# Vi mode
bindkey -v

# Prompt
eval "$(starship init zsh)"
