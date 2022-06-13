

let myOptional: String?

myOptional = nil

// CRASH - Force unwrapping
//let text: String = myOptional!

// NO CRASH - Check for nil value
if myOptional != nil {
    let _: String = myOptional!
    print("YES")
}

// NO CRASH - Optional Binding
if let safeOptional = myOptional {
    let _: String = safeOptional // ! not required anymore
}

// Nil Coalescing Operator
let text: String = myOptional ?? "Default value"
print(text)


struct MyOptionalStruct {
    var property = 123
    func method() {
        print("Method")
    }
}

var myOptionalStruct: MyOptionalStruct?

myOptionalStruct = nil

print(myOptionalStruct?.property)


