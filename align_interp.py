#!/bin/python3

import sys

interp_path = sys.argv[1]
with open(interp_path, 'r') as f:
    interp_lines = [l.strip() for l in f.readlines()]

alignments = eval(sys.stdin.read())
result_lines = []
for (trans_ids, aligned_src_ids) in sorted(alignments, key=lambda x: x[0][0]):
    result_line = ''
    for aligned_src_id in aligned_src_ids:
        result_line += interp_lines[aligned_src_id]
    result_lines.append(result_line)

print('\n'.join(result_lines))
