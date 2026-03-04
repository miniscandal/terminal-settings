#!/bin/fish

set -g fish_greeting ""

set THEME_FILE ~/miniscandal/profile/src/assets/oh-my-posh/themes/catppuccin.omp.json
oh-my-posh init fish --config $THEME_FILE | source

echo -e "\e[34m \n𓆝 𓆟 𓆞 𓆝 𓆛 𓆝 𓆟 𓆞 𓆝 𓆛 𓆝 𓆟 𓆞 𓆝 𓆛 𓆝 𓆟 \e[0m"
echo -e -n "\n> fish" | pv -qL 20
printf "\033[?25l"
printf "\n\n"
printf "\033[A"
printf "\033[A"
printf "\033[A"
printf "\033[%dC" (string length -- "fish    ")
printf ",-,\n"
printf "\033[%dC" (string length -- "fish   ")
printf "('_)<\n"
printf "\033[%dC" (string length -- "fish    ")
printf "`-`"
printf "\033[A"
printf "\033[%dC" (string length -- " ")
printf "\033[?25h"
echo -e " command shell!" | pv -qL 10
echo -e "\e[34m \n𓆝 𓆟 𓆞 𓆝 𓆛 𓆝 𓆟 𓆞 𓆝 𓆛 𓆝 𓆟 𓆞 𓆝 𓆛 𓆝 𓆟 \n \e[0m"
printf "\033[?25h"

# Aliases
if type -q eza
    # Redefining ls allows standard flags (-a, -l) to be passed to eza
    alias ls='eza --icons --group-directories-first'

    # Provides a tree view limited to 2 levels
    alias tree='eza --tree --icons --level=2'
else
    # Fallback: ensures 'ls' remains functional and colored
    alias ls='ls --color=auto'
end
