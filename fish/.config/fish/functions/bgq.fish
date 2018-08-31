function bgq
 bazel query --output=graph $argv | dot -Tx11
end

