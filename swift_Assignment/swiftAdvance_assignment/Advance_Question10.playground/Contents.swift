import UIKit

@propertyWrapper
struct nonNegative
{
    private var number: Int
    init()
    {
        self.number=0
    }
    
    var wrappedValue:Int{
        get{ return number}
        set {number = max(newValue,0)}
    }
}

struct Check
{
    @nonNegative var num:Int
}

var obj = Check()
print(obj.num)
obj.num = obj.num + 10
print(obj.num)
var obj1 = Check()
obj1.num = obj1.num - 5
print(obj1.num)
