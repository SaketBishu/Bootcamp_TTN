import UIKit

struct Personal_Info
{
    var Emp_id:Int
    var name:String
    var country:String
    var address:String
    var hobbies:String?
    
    init(Emp_id:Int,name:String,country:String,address:String) {
        self.Emp_id = Emp_id
        self.name = name
        self.country = country
        self.address = address
    }
}

struct Professional_Info
{
    var Emp_id:Int
    var name:String
    var department:String
    var branch:String
    var Experience:Int
    
    init(Emp_id:Int,name:String,department:String,branch:String,Experience:Int) {
        self.Emp_id = Emp_id
        self.name = name
        self.department = department
        self.branch = branch
        self.Experience = Experience
    }
    
    
}

struct Common_Info
{
    var Emp_id:Int
    var name:String
    var country:String
    var address:String
    var department:String
    var branch:String
    var Experience:Int
    var hobbies:String?
    
    
}

var personal=[Personal_Info]()
personal.append(Personal_Info(Emp_id:1,name:"saket",country:"america",address:"losangeles"))
personal.append(Personal_Info(Emp_id:2,name:"Rahul",country:"India",address:"noida"))
personal.append(Personal_Info(Emp_id:3,name:"Ranjan",country:"britain",address:"london"))
personal.append(Personal_Info(Emp_id:4,name:"Mohit",country:"japan",address:"fuzi"))
personal.append(Personal_Info(Emp_id:5,name:"shubham",country:"china",address:"chinsuu"))
personal[1].hobbies = "painting"

var Professional=[Professional_Info]()
Professional.append(Professional_Info(Emp_id:1,name:"saket",department:"iOS",branch:"america",Experience:2))
Professional.append(Professional_Info(Emp_id:2,name:"Rahul",department:"Android",branch:"noida",Experience:3))
Professional.append(Professional_Info(Emp_id:4,name:"Mohit",department:"JVM",branch:"japan",Experience:2))
Professional.append(Professional_Info(Emp_id:5,name:"shubham",department:"Fullstack",branch:"china",Experience:1))
Professional.append(Professional_Info(Emp_id:6,name:"Raghav",department:"web",branch:"chinsuu",Experience:4))

//print(personal[1].hobbies!)

//****** Question1 ***********

var Common=[Common_Info]()

for ind in 0...4
{
    for indx in 0...4
    {
        if(personal[ind].Emp_id == Professional[indx].Emp_id)
        {
            Common.append(Common_Info(Emp_id:personal[ind].Emp_id, name:personal[ind].name, country:personal[ind].country, address:personal[ind].address, department:Professional[indx].department, branch:Professional[indx].branch, Experience:Professional[indx].Experience, hobbies:personal[ind].hobbies))
            
        }
    }
}
//print(Common[0].Emp_id)

//********* Question2 ***********
func listbycountry(_ pers1:[Personal_Info],_ prof1:[Professional_Info])
{
    let check_country:String="america"
    for i in 0...4
    {
        if(pers1[i].country == check_country)
        {
            print(pers1[i].Emp_id)
            print(pers1[i].name)
            print(pers1[i].country)
            print(pers1[i].address)
    
            for j in 0...4
            {
                if(prof1[j].Emp_id == pers1[i].Emp_id)
                {
                    print(prof1[j].department)
                    print(prof1[j].branch)
                    print(prof1[j].Experience)
                    
                }
            }
        }
    }
}
listbycountry(personal,Professional)

//********* Question3 *********

print("********************************************")
func listbydepartment(_ prof2:[Professional_Info])
{
    for i in 0...4
    {
    let check_department:String="Android"
        if(prof2[i].department == check_department)
        {
            print(prof2[i].Emp_id)
            print(prof2[i].name)
            print(prof2[i].department)
            print(prof2[i].branch)
            print(prof2[i].Experience)
        }
    }
}

listbydepartment(Professional)

//******* Question4 **********

print("********************************************")
func listbycountry_branch(_ common1:[Common_Info])
{
    var count:Int=0
    let check_dep_branch:String = "India"
    for i in 0...3
    {
        if((common1[i].country == check_dep_branch) && (common1[i].branch == check_dep_branch) )
        {
            print(common1[i].Emp_id)
            print(common1[i].name)
            print(common1[i].department)
            print(common1[i].branch)
            print(common1[i].Experience)
            print(common1[i].country)
            print(common1[i].address)
            count=count+1
        }
    }
    if(count == 0)
    {
        print("No such employee")
    }
}

listbycountry_branch(Common)

//*********** Question5 ***********
print("********************************************")
func listbyhobby(_ pers3:[Personal_Info],_ prof3:[Professional_Info])
{
    for i in 0...4
    {
        if(pers3[i].hobbies != nil)
        {
            //print(pers3[i].Emp_id)
            print(pers3[i].name)
            /*print(pers3[i].country)
            print(pers3[i].address)
            print(pers3[i].hobbies!)*/
            
            
            for j in 0...4
            {
                if(prof3[j].Emp_id == pers3[i].Emp_id)
                {
                   print(prof3[j].Experience)
                    
                }
            }
        }
    }
}

listbyhobby(personal,Professional)

//******* Question6 **********
print("********************************************")

func listbynamestart(_ pers4:[Personal_Info])
{
    for i in 0...4
    {
        //indexx= pers4[i].name.index(pers4[i].name.firstIndex,offsetBy:1)
        //let c:Character = pers4[i].name[indexx]
        if(pers4[i].name[pers4[i].name.startIndex] == "s")
        {
            print(pers4[i].name)
        }
    }
}
listbynamestart(personal)


