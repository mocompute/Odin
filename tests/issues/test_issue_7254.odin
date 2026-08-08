package main

Foo :: []Struct
Distinct :: distinct Foo

Struct :: struct {
	foo: Foo,		// ok
	boom: Distinct,		// causes seg fault
}

main :: proc() {
}
