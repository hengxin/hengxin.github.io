#!/bin/bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

find_python2() {
    local local_python2

    if [[ -d "$script_dir/.python2" ]]; then
        local_python2="$(find "$script_dir/.python2" -maxdepth 3 -type f \( -name 'pypy.exe' -o -name 'python.exe' -o -name 'pypy' -o -name 'python2' \) | head -n 1)"
        if [[ -n "$local_python2" ]]; then
            printf '%s\n' "$local_python2"
            return 0
        fi
    fi

    if command -v python2 >/dev/null 2>&1; then
        command -v python2
        return 0
    fi

    echo "Python 2 runtime not found. Install a repo-local runtime under .python2/ or add python2 to PATH." >&2
    exit 1
}

python2_bin="$(find_python2)"
dependencies=(
    "$script_dir/MENU"
    "$script_dir/jemdoc.py"
    "$script_dir/jemdoc.css"
)

compiled_files=()

for file in "$script_dir"/*.jemdoc; do
    target="${file%.jemdoc}.html"
    needs_build=false

    if [[ ! -f "$target" ]]; then
        needs_build=true
    else
        for dependency in "$file" "${dependencies[@]}"; do
            if [[ "$dependency" -nt "$target" ]]; then
                needs_build=true
                break
            fi
        done
    fi

    if [[ "$needs_build" == true ]]; then
        "$python2_bin" "$script_dir/jemdoc.py" "$file"
        echo "Compiled $(basename "$file")"
        compiled_files+=("$(basename "$file")")
    fi
done

if [[ ${#compiled_files[@]} -eq 0 ]]; then
    echo "No pages needed recompilation."
else
    printf 'Updated files: %s\n' "${compiled_files[*]}"
fi

if [[ -z "$(git status --porcelain)" ]]; then
    echo "No git changes to commit."
    exit 0
fi

commit_message="Update site"
if [[ ${#compiled_files[@]} -gt 0 ]]; then
    commit_message="Rebuild site (${#compiled_files[@]} pages)"
fi

git add -A

if git diff --cached --quiet; then
    echo "No staged changes to commit."
    exit 0
fi

git commit -m "$commit_message"
git push
echo "Committed and pushed successfully."
