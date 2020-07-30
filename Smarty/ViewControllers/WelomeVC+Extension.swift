//
//  Wel omeVC+Extension.swift
//  Smarty
//
//  Created by MohamedNouri on 30/07/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import UIKit
extension WelcomeViewController: UITextFieldDelegate{
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide Keyboard
        view.endEditing(true)
        GoToHome()
        return true
    }
    
    
}
