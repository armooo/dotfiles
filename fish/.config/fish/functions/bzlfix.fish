function bzlfix
    pushd ~/server
    bazel build //build_tools:bzl >&2 /dev/null
    set targets (bazel query --keep_going "rdeps(..., $argv[1], 1) except (//analytics/...)" >&2 /dev/null)
    for t in $targets
        echo "Fixing: " $t
        ./bazel-bin/build_tools/bzl gen $t
    end
    popd
end

