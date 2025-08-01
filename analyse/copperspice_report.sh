#!/bin/bash
echo "CI_PROJECT_URL=https://github.com/copperspice/internal-copperspice/" > env.txt
echo "CI_COMMIT_SHA=22-fix-warnings" >> env.txt

cat log.w4.all.parsed.txt | ./verification/tr_customize.py | ./verification/tr_interest.py | grep "|CsCore|" > temp_interest.log
cat temp_interest.log | ./verification/create_report.py | ./verification/apply_environment.py env.txt > report.html
start report.html
cat temp_interest.log | ./verification/summarize.py
