// Tests issue https://github.com/odin-lang/Odin/issues/5851
package test_issues

import "core:testing"

R1 :: struct {
	a: u16,
	b: u64,
	c: u64,
}

R2 :: struct {
	d: u16,
	r1: R1,
	e: u64,
}

@(test)
test_offset :: proc(t: ^testing.T) {
	r1: R1
	r2: R2

	testing.expect_value(t,
			     offset_of(r2.r1.c),
			     offset_of(r2.r1) + offset_of(r1.c))
}
