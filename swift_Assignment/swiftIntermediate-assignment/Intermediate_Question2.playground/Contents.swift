import UIKit

enum operation
{
    case multiply,substraction,addition,square_root,division
}
class Calculator
{
    func equals(eval:operation,num1:Int,num2:Int)
    {
        switch eval{
        case .multiply: print(num1 * num2)
        case .substraction: print(num1 - num2)
        case .addition: print(num1 + num2)
        case .square_root: print(sqrt(Double(num1)))
        case .division: print(num2 / num1)
        }
    }
}

let calc = Calculator()
calc.equals(eval: .substraction, num1: 2, num2: 3)


