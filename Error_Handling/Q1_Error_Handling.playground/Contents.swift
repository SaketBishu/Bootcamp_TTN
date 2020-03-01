import UIKit

enum MyError: Error
{
    case notValidAge
}

func testUser(age :Int) throws
{
    guard age>0 else{
        throw MyError.notValidAge
    }
}

do{
   try testUser(age:-1 )
}
catch let error
{
    print(error)
}
