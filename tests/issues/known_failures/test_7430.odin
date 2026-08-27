// Tests https://github.com/odin-lang/Odin/issues/7430
package tests_issues_known_failures

import "core:testing"

@(test)
test :: proc(t: ^testing.T) {
	U :: union  { T }
	T :: struct { []u32 }
	u := [dynamic; 4]U { T{} }

	testing.expect(t, len(u) == 1)
}

// fails
// T :: struct { []u32 }
// T :: struct { [dynamic]int }
// T :: struct { map[int]int }

// works
// T :: struct { int }
// T :: struct { [2]u32 }
