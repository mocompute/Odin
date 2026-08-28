https://github.com/odin-lang/Odin/issues/7470
package main

Node :: struct {
	next: Maybe(Node),
}

main :: proc() {
	node: Node
	_ = node.next == nil
}
