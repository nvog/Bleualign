#!/bin/bash

if [ $# != 5 ]; then
    echo "Usage: align_all.sh <src-transcript> <tgt-transcript> <srctotarget-aligned-transcript> <output-file-name> <interp-transcript>"
    echo "e.g.: align_all.sh parallel/ja/BenKacyra_2011G_ja.txt aligned_en/BenKacyra_2011G_en.txt parallel/en/BenKacyra_2011G_en.txt test.txt aligned_ja/test/Arank/BenKacyra_2011G_ja.txt"
    echo
    echo "Outputs 3 aligned files: <output-file-name>-s <output-file-name>-t <output-file-name>-i for source, target, interpretation"
    exit 1;
fi

python3 `dirname $0`/bleualign.py -s $1 \
-t $2 \
--srctotarget $3 \
-o $4
python3 `dirname $0`/align_interp.py $5 < align.log > "$4"-i
rm align.log
