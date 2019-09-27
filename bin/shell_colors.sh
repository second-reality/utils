#!/usr/bin/env bash

random_char()
{
    tr -dc A-Za-z0-9 </dev/urandom | head -c 60
}

print_range()
{
    name=$1
    start=$2
    end=$3
    special_mod=$4

    for c in $(seq $start $end)
    do
        echo -e "$name$c: \e[$special_mod$c""m$(random_char)\e[0m"
    done
}

driver()
{
  #https://misc.flogisoft.com/bash/tip_colors_and_formatting
  print_range MOD 1 8
  print_range BASE 30 37
  print_range BASE 90 97
  print_range BASE 40 47
  print_range BASE 100 107
  print_range 256-COLOR 0 255 "38;5;"
}

driver | less -R
