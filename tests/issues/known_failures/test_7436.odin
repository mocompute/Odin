// https://github.com/odin-lang/Odin/issues/7436
package tests_issues_known_failures

import "core:fmt"

IUnknown::struct{
   using _iunknown_vtable:^IUnknown_VTable
}
IUnknown_VTable::struct{
   call_IUnknown:proc(this:^IUnknown)
}

IObject1::struct #raw_union{
   #subtype iunknown:IUnknown,
   using iobject1_vtable:^IObject1_VTable
}
IObject1_VTable::struct{
   using iunknown_vtable:IUnknown_VTable,
   call_IObject1:proc(this:^IObject1)
}

IObject2::struct #raw_union{
   #subtype iobject1:IObject1,
   using iobject2_vtable:^IObject2_VTable
}
IObject2_VTable::struct{
   using iobject1_vtable:IObject1_VTable,
   call_IObject2:proc(this:^IObject2)
}

IObject3::struct #raw_union{
   #subtype iobject2:IObject2,
   using iobject3_vtable:^IObject3_VTable
}
IObject3_VTable::struct{
   using iobject2_vtable:IObject2_VTable,
   call_IObject3:proc(this:^IObject3)
}

i2:=IObject2{
   iobject2_vtable=&{
      call_IUnknown=proc(this:^IUnknown){fmt.printfln("%T %w",this,this)},
      call_IObject1=proc(this:^IObject1){fmt.printfln("%T %w",this,this)},
      call_IObject2=proc(this:^IObject2){fmt.printfln("%T %w",this,this)}
   }
}
i3:=IObject3{
   iobject3_vtable=&{
      call_IUnknown=proc(this:^IUnknown){fmt.printfln("%T %w",this,this)},
      call_IObject1=proc(this:^IObject1){fmt.printfln("%T %w",this,this)},
      call_IObject2=proc(this:^IObject2){fmt.printfln("%T %w",this,this)},
      call_IObject3=proc(this:^IObject3){fmt.printfln("%T %w",this,this)}
   }
}

external::proc(that:IUnknown){fmt.printfln("%T %w",that,that)}


main :: proc() {
	external(i2)
	external(i3) // <- this crashes but the following compiles fine
	// external(cast(IUnknown)cast(IObject1)cast(IObject2)i3)

	// i:IUnknown
	// i=i2
	// i=i3 // <- this crashes but the following compiles fine
	// i=cast(IUnknown)cast(IObject1)cast(IObject2)i3
}
