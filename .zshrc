# type zcalc in cli for quick maths
autoload -Uz zcalc 

# ignore lowercase entries when searching in cli
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# config prompt and include git repo name and branch
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
#PROMPT=\$vcs_info_msg_0_'%2~ %# '
PROMPT=\$vcs_info_msg_0_'%K{33}%F{0} %2~ %f%k%#'
zstyle ':vcs_info:git:*' formats '%K{11}%F{0} %r %f%k%K{197}%F{15} %b %f%k'

# use xterm color settings (ex. for folders)
export CLICOLOR=1

# Prompt notes:
# %# displays # is su otherwise %
# %2~ shows path to 2 levels
# %*  shows time and day
# %B turns bold on 
# %F and %f turns foreground color on and off 
# %K and %k turns background color on and off 

# GIT style notes:
# %b shows branch 
# %r is repo name

# Colors
# %F{0} through %F{255} to use item colors
# black, red, green, yellow, blue, magenta, cyan and white