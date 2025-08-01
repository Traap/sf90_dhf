#!/usr/bin/env python3
import re
from pathlib import Path
import sys

include_pattern = re.compile(r"\[INCLUDE:\s*(.+?)\s*\]")

def resolve_includes(path: Path, visited: set) -> list[str]:
    if path in visited:
        print(f"⛔️ Skipping already included file (possible loop): {path}")
        return [f"<!-- Skipping already included file: {path} -->"]

    visited.add(path)

    try:
        lines = path.read_text(encoding="utf-8").splitlines()
    except Exception as e:
        print(f"⛔️ Failed to read file: {path}")
        return [f"<!-- Error reading file: {path} -->"]

    output = []
    for line in lines:
        match = include_pattern.search(line)
        if match:
            rel_include = match.group(1).strip()
            include_path = (path.parent / rel_include).resolve(strict=False)

            print(f"🔍 Resolving include from: {path}")
            print(f"   → Relative path: {rel_include}")
            print(f"   → Resolved path: {include_path}")

            if not include_path.exists():
                print(f"⚠️  Missing include: {include_path}")
                output.append(f"<!-- Missing include: {include_path} -->")
                continue

            output.extend(resolve_includes(include_path, visited))
        else:
            output.append(line)

    return output

def main():
    if len(sys.argv) != 3:
        print("Usage: preprocess.py input.mdd output.md")
        sys.exit(1)

    input_path = Path(sys.argv[1]).resolve()
    output_path = Path(sys.argv[2]).resolve()

    print(f"📄 Preprocessing: {input_path}")
    print(f"✍️  Writing output to: {output_path}")

    visited = set()
    result_lines = resolve_includes(input_path, visited)

    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text("\n".join(result_lines) + "\n", encoding="utf-8")

    print(f"✅ Includes resolved and written to: {output_path}")

if __name__ == "__main__":
    main()

