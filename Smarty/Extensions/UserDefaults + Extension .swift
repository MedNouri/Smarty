//
//  UserDefaults.swift
//  Smarty
//
//  Created by MohamedNouri on 30/07/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import Foundation
enum UserDefaultsKeys : String {
    case userInformation
   
}

extension UserDefaults{

    //MARK: Set User Name
    func setUserName(name: String) {
        set(name, forKey: UserDefaultsKeys.userInformation.rawValue)
     }

  

    //MARK: Get  User Name
    func getUserName() -> String?{
        return string(forKey: UserDefaultsKeys.userInformation.rawValue)
    }
}
