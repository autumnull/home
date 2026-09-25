function flame -d "create a flamegraph for a command"
    perf record -F1000 -g -o - -- $argv \
    | perf script -i - \
    | sed -E 's/x \\d+ \\d+\\.\\d+/x/g' \
    | stackcollapse-perf - \
    | flamegraph - \
    > flame.svg
end
