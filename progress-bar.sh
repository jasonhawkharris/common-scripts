#!/bin/zsh
start=1
end=6683

function repeat_char() {
	for i in {1..$1}; do echo -n "$2"; done
}

function get_percent_completed() {
    percent=$((($1 * 100) / $2))
    echo $percent
}

function progress_bar() {
    percent_completed=$(get_percent_completed $1 $2)
    num_of_blocks=$((percent_completed / 2))
    num_of_underscores=$((50 - num_of_blocks))
    blocks=$(repeat_char $num_of_blocks "\u2588")
    underscores=$(repeat_char $num_of_underscores "_")
    printf "\rProgress (%s%%): [%s%s] (%s/%s) Done%%" $percent_completed $blocks $underscores $1 $2

}

for ((i = 1; i < 6684; i++)) do
    progress_bar $i $end
done

progress_bar $end $end
