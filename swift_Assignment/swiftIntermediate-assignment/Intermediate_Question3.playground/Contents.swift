import UIKit

struct operation
{
    var mul:(Int,Int)->Int={(num1:Int,num2:Int)->Int in
                            return num1 * num2}
    var add:(Int,Int)->Int={(num1:Int,num2:Int)->Int in
                            return num1 + num2}
    var sub:(Int,Int)->Int={(num1:Int,num2:Int)->Int in
                            return num1 - num2}
    var Sqr:(Int,Int)->Int={(num1:Int,num2:Int)->Int in
                            return num1 * num1}
    var div:(Int,Int)->Int={(num1:Int,num2:Int)->Int in
                            return num1 / num2}
    
    func calculate(n1:Int,n2:Int,opt:(Int,Int)->Int) -> Int
    {
        return opt(n1,n2)
    }
}

let calc = operation()
var solution = calc.calculate(n1:4,n2:5,opt:calc.add)
