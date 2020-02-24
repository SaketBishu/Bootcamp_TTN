import UIKit

protocol Myprotocol
{
    func sayHello() -> ()
}

class Myclass
{
    var name:String
    
    init(name:String)
    {
        self.name = name
    }
}

extension Myclass : Myprotocol
{
    func sayHello() ->() {
        print("Hello \(name)")
    }
}

var obj = Myclass(name:"Saket")
obj.sayHello()
