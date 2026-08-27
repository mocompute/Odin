// https://github.com/odin-lang/Odin/issues/6985
package tests_issues_known_failures

example :: proc() -> (Maybe(int), Maybe(int)) {
	defer unreachable()
	return 0, 0
}

main :: proc() {
	example()
}
