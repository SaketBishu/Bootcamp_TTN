import UIKit

let numbers = [1,2,3,4,5]
let doubled = numbers.map{$0*2}
print(doubled)

let varnum:[String] = ["1","2","NotAnumber"]
let ints = varnum.compactMap{ Int($0)}
print(ints)
