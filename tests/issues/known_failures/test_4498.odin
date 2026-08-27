package main

import "core:fmt"

Cache_Line :: struct {
	next: ^Cache_Line,
	is_foo: b32,
	foos: i32,
	bars: i32,
	pad: [64 - offset_of(Cache_Line, pad)]u8,
}

main :: proc()
{
	c: Cache_Line
	fmt.println(c)
}
