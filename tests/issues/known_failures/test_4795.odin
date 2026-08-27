// Tests https://github.com/odin-lang/Odin/issues/4795
package test_issues_known_failures

Foo :: struct {
    bar: [len(Foo{}.bar)]int,
}
