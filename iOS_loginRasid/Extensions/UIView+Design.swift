import UIKit

extension UIView {
    
    @IBInspectable var radius: CGFloat {
        get {
            self.radius
        } set {
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            self.layer.borderWidth
        } set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            UIColor(cgColor: self.layer.borderColor ?? UIColor.black.cgColor)
        } set {
            self.layer.borderColor = newValue.cgColor
        }
    }
}
