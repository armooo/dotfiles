function brun
    pushd ~/server
    bazel build $argv[1]
    popd
    if string match '*:*' $argv[1]
        set bin (string replace // ~/server/bazel-bin/ (string replace : / $argv[1]))
    else
        set last (string split --max 1 --right / $argv[1])[2]
        set bin (string replace // ~/server/bazel-bin/ $argv[1])/$last
    end
    set args $argv[2..-1]
    eval $bin $args
end

