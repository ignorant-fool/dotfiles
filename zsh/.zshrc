plugins=(virtualenv)


neofetch

#### Taken from DevAsLife (many thanks!)
alias ll="exa -l --icons --colour=never"
alias lla="ll -a"
alias llt="ll --tree --level=2"
####

alias python=python3
alias pip=pip3
eval $(thefuck --alias)

alias r=radian
export EDITOR=vim

alias icat="kitty +kitten icat --align left"


#### Taken from virtualenv plugin
function virtualenv_prompt_info(){
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "${ZSH_THEME_VIRTUALENV_PREFIX=[}${VIRTUAL_ENV:t:gs/%/%%}${ZSH_THEME_VIRTUALENV_SUFFIX=]} "
}

# disables prompt mangling in virtual_env/bin/activate
export VIRTUAL_ENV_DISABLE_PROMPT=1
####


#### Adapted from twny (many thanks!!)
set_rainbow_prompt() {
    local input="$(print -P "$(virtualenv_prompt_info)hbutton@%m %~ $") "
    local prompt_string=""
    local color_idx=1
    local color

    for ((i=0; i<${#input}; i++)); do
        char="${input:$i:1}"
        color=${rainbow_colors[$color_idx]}
        prompt_string+="%F{$color}$char"
        color_idx=$((color_idx % ${#rainbow_colors[@]} + 1))
    done

    prompt_string+="%F{reset}"
    PROMPT=$prompt_string
}

rainbow_colors=("#8c00ff"  "#a000ff"  "#b400ff"  "#c800ff"  "#dc00ff"  "#f000ff"  "#ff00f0"  "#ff00dc"  "#ff00c8"  "#ff00b4"  "#ff00a0"  "#ff008c"  "#ff0078"  "#ff0064"  "#ff0050"  "#ff003c"  "#ff0028"  "#ff0014"  "#ff0000"  "#ff1400"  "#ff2800"  "#ff3c00"  "#ff5000"  "#ff6400"  "#ff7800"  "#ff8c00"  "#ffa000"  "#ffb400"  "#ffc800"  "#ffdc00"  "#fff000"  "#fdff00"  "#e9ff00"  "#d5ff00"  "#c1ff00"  "#adff00"  "#99ff00"  "#85ff00"  "#71ff00"  "#5dff00"  "#49ff00"  "#35ff00"  "#21ff00"  "#0dff00"  "#00ff0d"  "#00ff21"  "#00ff35"  "#00ff49"  "#00ff5d"  "#00ff71"  "#00ff85"  "#00ff99"  "#00ffad"  "#00ffc1"  "#00ffd5"  "#00ffe9"  "#00fffd"  "#00f0ff"  "#00dcff"  "#00c8ff"  "#00b4ff"  "#00a0ff"  "#008cff"  "#0078ff"  "#0064ff"  "#0050ff"  "#003cff"  "#0028ff"  "#0014ff"  "#0000ff"  "#1400ff"  "#2800ff"  "#3c00ff"  "#5000ff"  "#6400ff"  "#7800ff"  )

precmd_functions+=(set_rainbow_prompt)
####
