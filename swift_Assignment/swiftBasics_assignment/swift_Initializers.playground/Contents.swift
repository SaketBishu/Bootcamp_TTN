import UIKit

//********* Question 1 **********

struct Temperature
{
    var celsius:Float
    init(celsius:Float)
    {
        self.celsius = celsius
    }
}
let temp = Temperature(celsius:25.5)
print(temp.celsius)

// ********* Question 3 ***********

class Movie
{
    var title:String
    var author:String
    var publish_date:String
    var price:Int?
    
    init(title:String,author:String,publish_date:String)
    {
        self.title=title
        self.author=author
        self.publish_date=publish_date
    }
    
    convenience init(price:Int)
    {
        
        self.init(title:"rhtd",author:"srk",publish_date:"2019-01-21")
        self.price=price
    }
}

var movie = Movie(price: 23)
print(movie.price!)
print(movie.title)
print(movie.author)
print(movie.publish_date)

 

// ******** Question4 ********
enum ValidationError:Error{
    case invalid
}


struct Myinitializer
{
    var str:String?
    init(name:String?) throws
    {
            if name!.contains("saket")
            {
                str = name!
            }
            else{
                throw ValidationError.invalid
                }
    }
}
    do{
    var _ = try Myinitializer(name:"Saket kumar")
    }
    catch ValidationError.invalid
{
    print("name should contain saket")
}

