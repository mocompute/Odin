// Tests https://github.com/odin-lang/Odin/issues/3099
package tests_issues_known_failures

import "core:fmt"
import "core:container/queue"

import "core:testing"

@(test)
test :: proc(t: ^testing.T) {
	pool: queue.Queue(int)
	queue.init(&pool)

	h1 := Handle(int){0, 1}
	h2 := Handle(int){1, 0}

	remap: map[Handle(int)]Handle(int)

	remap[h1] = h2

	shrink(&pool, remap)
}

Handle :: struct($T: typeid) {
  index:      int,
  generation: u64,
}

shrink :: proc(pool: ^queue.Queue($T), remapped: map[Handle(T)]Handle(T)) {
	fmt.println(remapped)
}
