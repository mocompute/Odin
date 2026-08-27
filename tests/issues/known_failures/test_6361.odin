// https://github.com/odin-lang/Odin/issues/6361
package test_issues_known_failures

import "core:testing"

Vec2 :: [2]f32
Pair :: struct { v: Vec2 }

@(test)
test :: proc(t: ^testing.T) {
	ok1 := -Vec2{1, 5}
	testing.expect(t, ok1 == Vec2{-1, -5})

	ok2 := Pair{v = Vec2{-1, -5}}
	testing.expect(t, ok2 == Pair{Vec2{-1, -5}})

	bad := Pair{v = -Vec2{1, 5}}
	testing.expect_value(t, bad, Pair{Vec2{-1, -5}})
}
