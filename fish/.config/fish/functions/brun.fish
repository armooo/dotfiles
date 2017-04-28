function brun
    pushd ~/server
    bazel build $argv[1]
    popd
    set bin (string replace // ~/server/bazel-bin/ (string replace : / $argv[1]))
    eval $bin $argv[2..-1]
end

