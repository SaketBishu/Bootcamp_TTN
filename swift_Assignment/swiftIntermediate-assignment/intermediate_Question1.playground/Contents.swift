import UIKit

func siftBeans(fromGroceryList List:[String])->(beans:[String],othergroceries:[String])
{
    var beans:[String]=[]
    var others:[String]=[]
    for item in List{
        if(item.contains("beans") || item.contains("Beans"))
        {
            beans.append(item)
        }
        else{
            others.append(item)
        }
    }
    return (beans,others)
}

let result = siftBeans(fromGroceryList:["green beans","milk","black beans","pinto beans","apples"])
print(result.beans)
print(result.othergroceries)
