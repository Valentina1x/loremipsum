#!/usr/bin/env bash
set -euo pipefail
for i in {1..5}; do
  n=$((RANDOM % 5 + 1))
  destino="loremipsum-${i}.txt"
  if curl -fsSL "https://www.lipsum.com/feed/plain?amount=${n}&what=paras&start=yes" -o "${destino}"; then
    :
  else
    curl -fsSL "https://www.lipsum.com/feed/html?amount=${n}&what=paras&start=yes" \
    | sed -e 's/<[^>]*>//g' -e 's/&nbsp;/ /g' -e 's/&amp;/\&/g' > "${destino}"
  fi
  printf '\n' >> "${destino}"
  echo "OK: generado ${destino}"
done
echo "Listo. Generados: loremipsum-1.txt ... loremipsum-5.txt"
