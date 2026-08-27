#!/bin/sh

set -eu

: "${ODIN:=../../../odin}"

tests="
	test_3099.odin
"

failures=0

for test in $tests; do

	if "$ODIN" test "$test" -file; then
		failures=$((failures + 1))
		echo "EXPECTED FAILURE PASSED: $test"
	fi

done

if [ "$failures" -gt 0 ]; then exit 1; else exit 0; fi
