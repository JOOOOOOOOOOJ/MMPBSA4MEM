#!/bin/bash
filename=4py0_rep1.agr

awk 'NR>8 {print $2, $1}' "$filename" | {
  read min_value first_column_value
  while read value column1; do
    if [[ $(echo "$value < $min_value" | bc -l) -eq 1 ]]; then
      min_value="$value"
      first_column_value="$column1"
    fi
  done
  echo "$first_column_value"
}
