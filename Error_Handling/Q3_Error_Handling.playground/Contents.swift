import UIKit


// TRY EXAMPLE

enum ValidationError:Error{
    case invalid
}


struct Myinitializer
{
    var str:String?
    init(name:String?) throws
    {
            if name!.contains("Saket")
            {
                str = name!
            }
            else{
                throw ValidationError.invalid
                }
    }
}
    do{
    var _ = try Myinitializer(name:"kumar")
    }
    catch ValidationError.invalid
{
    print("Object not able to initialize")
}


// TRY? EXAMPLE

import UIKit

enum ValidationError1:Error{
    case invalid
}


struct Myinitializer1
{
    var str1:String?
    init(name1:String?) throws
    {
            if name1!.contains("Saket")
            {
                str1 = name1!
            }
            else{
                throw ValidationError1.invalid
                }
    }
}
var _ = try? Myinitializer1(name1:"kumar")

// TRY! EXAMPLE

import UIKit

enum ValidationError2:Error{
    case invalid
}


struct Myinitializer2
{
    var str2:String?
    init(name2:String?) throws
    {
            if name2!.contains("Saket")
            {
                str2 = name2!
            }
            else{
                throw ValidationError2.invalid
                }
    }
}

var _ = try! Myinitializer2(name2:"Saket kumar")







