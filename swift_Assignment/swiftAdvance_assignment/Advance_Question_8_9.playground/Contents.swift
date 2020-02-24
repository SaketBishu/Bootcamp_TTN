import UIKit

//****** Question 8 *********

let values: [Int] = [1, 2, 3, 4, 5]

let sumOfNumbers = values.reduce(1000,{$0 + $1})
print(sumOfNumbers)

//******* Question 9 *********

struct Person
{
    var name:String
    var age: Int
}
let person1 = Person(name:"Saket",age:23)
let person2 = Person(name:"Devansh",age:30)
let person3 = Person(name:"Jay",age:27)
let person4 = Person(name:"Vipul",age:20)

let personArray = [person1,person2,person3,person4]

func isgreater(pers:Person)->Bool
{
    return pers.age>25
}

let greaterAge = personArray.filter(isgreater)

for per in greaterAge
{
    print(per)
}

