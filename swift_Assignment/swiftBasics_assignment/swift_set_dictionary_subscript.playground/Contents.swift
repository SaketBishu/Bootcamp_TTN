import UIKit

//*********** SET Questions ***********

let houseAnimals:Set=["Dog","Cat"]
let farmAnimals:Set=["buffaloo","Hen","Sheep","Dog","Cat"]
let cityAnimals:Set=["Sparrow","Rabbit"]
print(houseAnimals.isSubset(of:farmAnimals))
print(farmAnimals.isSuperset(of:houseAnimals))
print(farmAnimals.isDisjoint(with:cityAnimals))
let sub:Set = farmAnimals.subtracting(houseAnimals)
let unionset:Set = houseAnimals.union(farmAnimals).union(cityAnimals)


//*********** Dictionary Questions **********

//Question1

var dict = [String:Int]()
var dict1:[String:Int]=[:]
var dict2 = Dictionary<String,Int>()

//Question2

var secretidentities:[String:String]=["Hulk":"Bruce banner","Batman":"Bruce Wayne","Superman":"Clark kent" ]

//Question3
var dict3 = [String:Int]()
var dict4 = [String:[String:Int]]()
var dict5 = [String:[String:[String:Int]]]()

dict3["red"]=1
dict4["spotted"]=dict3
dict5["colors"]=dict4
print(dict5["colors"]!["spotted"]!["red"]!)


//Question4

for key in secretidentities.keys
{
    print(key)
}


//*********** Subscript Questions*********
//Question 2

struct Mysubscript
{
    var str:String
    subscript(substr:String)->Bool
    {
        if(str.contains(substr))
        {
            return true
        }
        else{
            return false
        }
    }
}
var obj = Mysubscript(str:"My Name is Saket")
print(obj["Saket"])
