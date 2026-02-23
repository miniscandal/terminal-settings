#!/bin/bash

eval "$(oh-my-posh init bash --config ~/.cache/oh-my-posh/themes/M365Princess.omp.json)"

echo -e "> Welcome, miniscandal! ⚝\n" | pv -qL 20
echo -e -n "> No Anime No Life ꉂ(˵˃ ᗜ ˂˵) - No Code No Life ＼_ﾍ(ω｀●)\n\n"

DIR=~/miniscandal/profile/src/assets/
CHARACTER_ID=""

# Random ascii-art character
if [ -z "$CHARACTER_ID" ]; then
  FILE=$(ls "$DIR"/ascii-arts/character-*.txt | shuf -n 1)
else
  FILE=$(ls "$DIR"/character-$CHARACTER_ID.txt)
fi

cat "$FILE" | lolcat -f

figlet "      miniscandal" | lolcat

TEXT_COLOR='\033[0;36m'
NC='\033[0m'

paste \
  <(catimg ${DIR}/stickers/dango-01.png -w 100 && echo -e "$TEXT_COLOR   Anime$NC") \
  <(catimg ${DIR}/stickers/dango-02.png -w 100 && echo -e "  ${TEXT_COLOR} Backend$NC") \
  <(catimg ${DIR}/stickers/dango-03.png -w 100 && echo -e "  ${TEXT_COLOR}Assembly$NC") \
  <(catimg ${DIR}/stickers/dango-04.png -w 100 && echo -e "  ${TEXT_COLOR}Frontend$NC") \
  <(catimg ${DIR}/stickers/dango-05.png -w 100 && echo -e " $TEXT_COLOR  K-pop$NC")
echo -e "\n"
