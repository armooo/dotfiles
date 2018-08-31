function bgq_png
 bazel query --output=graph $argv | dot -Tpng
end

