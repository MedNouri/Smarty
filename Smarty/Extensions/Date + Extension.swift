//
//  Date + Extension.swift
//  Smarty
//
//  Created by MohamedNouri on 30/07/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import Foundation

extension Date {

 static func getCurrentDate() -> String {

        let dateFormatter = DateFormatter()

    // date Formt to day/name/year
        dateFormatter.dateFormat = "LLLL dd,yyyy"

        return dateFormatter.string(from: Date())

    }
}
