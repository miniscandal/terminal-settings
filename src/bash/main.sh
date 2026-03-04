#!/bin/bash

OS_RELEASE=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d'=' -f2 | tr -d '"')

echo -e "> Welcome, miniscandal! ⚝\n" | pv -qL 15
echo -e "> User: $USER | OS Release: $OS_RELEASE ☾\n"
echo -e -n "> No Anime No Life ꉂ(˵˃ ᗜ ˂˵) - No Code No Life ＼_ﾍ(ω｀●)\n\n"

PROFILE_DIR=~/miniscandal/profile
DIR_ASCII_ARTS=$PROFILE_DIR/src/assets/ascii-arts

# Random ascii-art
ASCII_ART="05.txt"
ASCII_ART_PATH=""
if [ -z "$ASCII_ART" ]; then
  ASCII_ART_PATH=$(ls ${DIR_ASCII_ARTS}/* | shuf -n 1)
else
  ASCII_ART_PATH=$(ls ${DIR_ASCII_ARTS}/${ASCII_ART})
fi

cat $ASCII_ART_PATH | lolcat -f

figlet "      miniscandal" | lolcat

TEXT_COLOR='\033[0;36m'
NC='\033[0m'

DIR_STICKERS=$PROFILE_DIR/src/assets/stickers

paste \
  <(catimg ${DIR_STICKERS}/dango-01.png -w 100 && echo -e "$TEXT_COLOR   Anime$NC") \
  <(catimg ${DIR_STICKERS}/dango-02.png -w 100 && echo -e "  ${TEXT_COLOR} Backend$NC") \
  <(catimg ${DIR_STICKERS}/dango-03.png -w 100 && echo -e "  ${TEXT_COLOR}Assembly$NC") \
  <(catimg ${DIR_STICKERS}/dango-04.png -w 100 && echo -e "  ${TEXT_COLOR}Frontend$NC") \
  <(catimg ${DIR_STICKERS}/dango-05.png -w 100 && echo -e " $TEXT_COLOR  K-pop$NC")
echo -e "\n"

export PATH="$PATH:$HOME/.local/bin"
THEME_FILE=~/miniscandal/profile/src/assets/oh-my-posh/themes/catppuccin.omp.json
eval "$(oh-my-posh init bash --config $THEME_FILE)"

# Aliases
if command -v eza > /dev/null 2>&1; then
  # Redefining ls allows standard flags (-a, -l) to be passed to eza
  alias ls='eza --icons --group-directories-first'

  # Provides a tree view limited to 2 levels
  alias tree='eza --tree --icons --level=2'
else
  # Fallback: ensures 'ls' remains functional and colored
  alias ls='ls --color=auto'
fi

export OLLAMA_HOST=$(ip route show default | awk '{print $3}'):11434
