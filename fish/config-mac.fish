neofetch

if type -q exa
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
    alias llt "ll --tree --level=2"
end 

# set custom ls colours
# https://the.exa.website/docs/colour-themes
set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD
set -Ux EXA_COLORS "di=36:da=32"


set -gx EDITOR vim

# for gcc and g++  
set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib,-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"
set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"



# below stolen from DevAsLife <3 many thanks.
function _peco_change_directory
  if [ (count $argv) ]
    peco --layout=bottom-up --query "$argv "|perl -pe 's/([ ()])/\\\\$1/g'|read foo
  else
    peco --layout=bottom-up |perl -pe 's/([ ()])/\\\\$1/g'|read foo
  end
  if [ $foo ]
    builtin cd $foo
    commandline -r ''
    commandline -f repaint
  else
    commandline ''
  end
end

function peco_change_directory
  begin
    echo $HOME/.config
    ls -ad */|perl -pe "s#^#$PWD/#"|grep -v \.git
  end | sed -e 's/\/$//' | awk '!a[$0]++' | _peco_change_directory $argv
end

function peco_select_history
  if test (count $argv) = 0
    set peco_flags --layout=bottom-up
  else
    set peco_flags --layout=bottom-up --query "$argv"
  end

  history|peco $peco_flags|read foo

  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end

function fish_user_key_bindings
  # peco
  bind \cr peco_select_history # Bind for peco select history to Ctrl+R
  bind \cf peco_change_directory # Bind for peco change directory to Ctrl+F
end


pyenv init - | source



if status is-interactive
    # Commands to run in interactive sessions can go here
end
