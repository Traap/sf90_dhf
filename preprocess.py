#!/usr/bin/env python3
import re
from pathlib import Path
import sys

INCLUDE_PATTERN = re.compile(r'\[INCLUDE: ([^\]]+)\]')

def preprocess(filepath: Path, seen=None, depth=0) -> str:
    if seen is None:
        seen = set()
    if filepath in seen:
        return f"[ERROR: Circular include detected: {filepath}]"
    if not filepath.exists():
        return f"[ERROR: File not found: {filepath}]"

    seen.add(filepath)
    content = filepath.read_text(encoding='utf-8')
    lines = []

    for i, line in enumerate(content.splitlines(), start=1):
        match = INCLUDE_PATTERN.search(line)
        if match:
            include_path = (filepath.parent / match.group(1)).resolve()
            included_content = preprocess(include_path, seen.copy(), depth + 1)
            lines.append(f"<!-- Begin include: {include_path} -->")
            lines.append(included_content)
            lines.append(f"<!-- End include: {include_path} -->")
        else:
            lines.append(line)

    return "\n".join(lines)

def add_line_numbers(text: str) -> str:
    return "\n".join(f"{i:4}: {line}" for i, line in enumerate(text.splitlines(), start=1))

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Resolve [INCLUDE: ...] statements in Markdown files.")
    parser.add_argument("input", type=Path, help="Input Markdown file with [INCLUDE:] tags")
    parser.add_argument("output", type=Path, help="Output file with includes resolved")
    parser.add_argument("--line-numbers", action="store_true", help="Add line numbers to output")
    args = parser.parse_args()

    combined = preprocess(args.input)

    if args.line_numbers:
        combined = add_line_numbers(combined)

    args.output.write_text(combined, encoding='utf-8')
    print(f"✅ Includes resolved and written to: {args.output}")
