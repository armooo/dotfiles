function bzler
    pushd ~/server
    bazel build //build_tools:bzl > /dev/null
    ./bazel-bin/build_tools/bzl gen --skip-deps-generation $argv
    popd
end

