import UIKit

enum CheckEligibility:Error
{
    case Absent
    case notCompletedYear
    case notEligibleCompetency
    case lessAttendance
}

struct Employee
{
    var empID:Int
    var empName:String
    var empEmail:String
    var joiningDate:String
    var isPresent:Bool
    var competency:String
    var attendancePercent:Int
    var yearCompleted:Int
    
    
    func allowedForBonus(emp:Employee) throws
    {
        if(emp.isPresent == false)
        {
            throw CheckEligibility.Absent
        }
        else if(emp.yearCompleted < 1)
        {
            throw CheckEligibility.notCompletedYear
        }
        else if(emp.competency == "Php" || emp.competency == "feen")
        {
            throw CheckEligibility.notEligibleCompetency
        }
        else if(emp.attendancePercent < 80)
        {
            throw CheckEligibility.lessAttendance
        }
        else{
            print("\(emp.empName) is eligible for bonus")
        }
        
    }
    
}


var employee = [Employee]()
employee.append(Employee(empID: 1, empName: "Saket", empEmail: "Saket@gmail.com", joiningDate: "11/2/2019", isPresent: true, competency: "iOS", attendancePercent: 100,yearCompleted: 1))
employee.append(Employee(empID: 2, empName: "Muskan", empEmail: "Muskan@gmail.com", joiningDate: "12/2/2018", isPresent: false, competency: "Drupal", attendancePercent: 85,yearCompleted: 2))
employee.append(Employee(empID: 3, empName: "Mithlesh", empEmail: "Mithilesh@gmail.com", joiningDate: "13/4/2017", isPresent: true, competency: "Php", attendancePercent: 80, yearCompleted: 3))
employee.append(Employee(empID: 4, empName: "Sachin", empEmail: "Sachin@gmail.com", joiningDate: "2/2/2020", isPresent: true, competency: "Big Data", attendancePercent: 80, yearCompleted: 0))


for emp in employee
{
    do{
        try emp.allowedForBonus(emp: emp)
    }
    catch CheckEligibility.Absent{
        print("\(emp.empName) is absent today")
    }
    catch CheckEligibility.lessAttendance{
        print("\(emp.empName) has attendance percent \(emp.attendancePercent) which is less than 80 ")
    }
    catch CheckEligibility.notCompletedYear{
        print("\(emp.empName) has not completed one year")
    }
    catch CheckEligibility.notEligibleCompetency{
        print("\(emp.empName) does not belong to the hot competency")
    }
    
}
