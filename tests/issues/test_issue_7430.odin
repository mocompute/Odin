// Tests issue #7430 https://github.com/odin-lang/Odin/issues/7430
package test_issues

import "core:fmt"
import "core:testing"

@(test)
test_case :: proc(t: ^testing.T) {
	U :: union  { T }
	T :: struct { []int }
	u := [dynamic; 4]U { T{} }
	fmt.printfln("{}, len = %d", u, len(u)) // []
	testing.expect(t, len(u) == 1)
}

// fails
// T :: struct { []u32 }
// T :: struct { [dynamic]int }
// T :: struct { map[int]int }

// works
// T :: struct { int }
// T :: struct { [2]u32 }
