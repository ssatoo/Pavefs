//
//  NETextField.swift
//  Pavefs
//


import UIKit

@IBDesignable
class NETextField: UITextField {
    @IBInspectable var insetX: CGFloat = 0
    @IBInspectable var insetY: CGFloat = 0
    var indID :String!
    // placeholder position
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds , insetX , insetY)
    }
    
    // text position
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds , insetX , insetY)
    }
}
