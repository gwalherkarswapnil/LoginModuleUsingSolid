//
//  DataEntryTextField.swift
//  HomeCustomer
//
//  Created by Jonathan Tyson on 7/6/17.

//  https://www.home.live
//  legal@home.live
//  This code is Copyright © 2018 Honed Real Estate Pty Ltd t/a Home Live. All Rights Reserved.
//  Any code falling under a separate copyright claim shall be noted as such where practical to do so
//  and does not diminish this claim over the remaining code.

import UIKit

@objc protocol DataEntryTextFieldDelegate {
    @objc optional func textFieldClearButtonTap(_ textField: UITextField)
}

class DataEntryTextField: UITextField {
    
    var clearButton = UIButton()
    weak var delegateClear: DataEntryTextFieldDelegate?
    var errorLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.borderStyle = UITextField.BorderStyle.none
        self.tintColor = UIColor.white
        self.textColor = UIColor.white
        
        // Add observer to check text did change
        NotificationCenter.default.addObserver(self, selector: #selector(textChange(notificationName:)), name: UITextField.textDidChangeNotification, object: nil)
        
        clearButton = UIButton(frame: CGRect.init(x: 0, y: 0, width: 15, height: 15))
        //clearButton.setImage(#imageLiteral(resourceName: "clearText"), for: UIControl.State.normal)
       // clearButton.setImage(#imageLiteral(resourceName: "checkBox"), for: UIControl.State.selected)
        self.rightView = clearButton
        clearButton.addTarget(self, action: #selector(clearClicked(sender:)), for: UIControl.Event.touchUpInside)
        clearButton.isHidden = true
        self.clearButtonMode = UITextField.ViewMode.never
        self.rightViewMode = UITextField.ViewMode.always
        
        errorLabel = UILabel(frame: CGRect(x: -10, y: self.bounds.height + 5, width: self.bounds.width + 20, height: 15))
        errorLabel.textColor = .white
        errorLabel.font = UIFont(name:"Poppins-Regular",size:12)
        self.addSubview(errorLabel)
        errorLabel.isHidden = true
        self.clipsToBounds = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //Set border of textfield
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: -10.0, y: self.frame.height - 1, width: self.frame.width + 20, height: 1.0)
        bottomLine.backgroundColor = UIColor.white.cgColor
        self.layer.addSublayer(bottomLine)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 12, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 12, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
    
    @objc func clearClicked(sender:UIButton) {
        
        if clearButton.isSelected {
            
        } else {
            self.text = ""
        }
        
        if let safeDelegate = delegateClear {
            safeDelegate.textFieldClearButtonTap!(self)
        }
        
    }
    
    // MARK: - UITextField Delegate Method
    @objc func textChange(notificationName:Notification){
        
    }
}
