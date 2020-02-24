import UIKit

class Mydelegate:UITextField
{
    //
}
extension Mydelegate:UITextFieldDelegate
{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("allow")
        return true
    }
}

