function bzlfix
    pushd ~/server
    bazel build //build_tools:bzl > /dev/null
    set targets (bazel query --keep_going "rdeps(..., $argv[1], 1) except (//analytics/...)" ^ /dev/null)
    for t in $targets
        echo "Fixing: " $t
        ./bazel-bin/build_tools/bzl gen --skip-deps-generation $t
    end
    popd
end

