#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob
archivos=(loremipsum-*.txt)
if (( ${#archivos[@]} == 0 )); then
  echo "No se encontraron archivos loremipsum-*.txt"
  exit 1
fi
for f in "${archivos[@]}"; do
  if [[ -s "$f" ]]; then
    lineas=$(wc -l < "$f")
    if [[ "$lineas" -eq 1 ]]; then
      echo "$f tiene $lineas línea."
    else
      echo "$f tiene $lineas líneas."
    fi
  else
    echo "$f está vacío."
  fi
done
