# Path to your oh-my-zsh installation.
  export ZSH=/Users/Zhou/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
  ZSH_THEME=pygmalion

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
  plugins=(git rails web-search jump)

# User configuration
  stty -ixon
  source "$HOME/.secrets"
  source $ZSH/oh-my-zsh.sh
  export PATH=$HOME/bin:/usr/local/bin:$PATH
  export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
  export PATH="$PATH:/Users/Zhou/.rvm/gems/ruby-2.2.2/bin:/Users/Zhou/.rvm/gems/ruby-2.2.2@global/bin:/Users/Zhou/.rvm/rubies/ruby-2.2.2/bin:/usr/bin:/bin:/Users/Zhou/.rvm/bin"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
      tat
      fi
    }
ensure_tmux_is_running

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
