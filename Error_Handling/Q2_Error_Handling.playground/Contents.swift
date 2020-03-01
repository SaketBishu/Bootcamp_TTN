import UIKit

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
