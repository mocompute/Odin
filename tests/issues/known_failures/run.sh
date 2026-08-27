#!/bin/sh

set -u

: "${ODIN:=../../../odin}"

tests="
	test_3099.odin
	test_5851.odin
"

checks="
	test_4498.odin
	test_4795.odin
"

failures=0

for f in $tests; do

	echo "Testing known failure $f."

	timeout 5 "$ODIN" test "$f" -file
	status=$?
	if [ "$status" -eq 124 ]; then
		# command timed out, expected failure
		status=1
	elif [ "$status" -eq 0 ]; then
		failures=$((failures + 1))
		echo "EXPECTED FAILURE PASSED: $f"
	fi

done

for f in $checks; do

	echo "Checking known failure $f."

	timeout 5 "$ODIN" check "$f" -file
	status=$?
	if [ "$status" -eq 124 ]; then
		# command timed out, expected failure
		status=1
	elif [ "$status" -eq 0 ]; then
		failures=$((failures + 1))
		echo "EXPECTED FAILURE PASSED: $f"
	fi

done


if [ "$failures" -gt 0 ]; then exit 1; else exit 0; fi
