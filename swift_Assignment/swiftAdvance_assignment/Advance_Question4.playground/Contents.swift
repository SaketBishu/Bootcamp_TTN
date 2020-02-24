import UIKit

enum WeekDays
{
    case Sun,Mon,Tue,Wed,Thurs,Fri,Sat
}
extension WeekDays
{
    func showday()
    {
        switch self
        {
        case .Sun: print("Sunday")
        case .Mon: print("Monday")
        default: print("it is \(self)")
        }
    }
}

WeekDays.Fri.showday()
