//
//  DataSource.swift
//  Smarty
//
//  Created by MohamedNouri on 29/07/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import Foundation


extension Room{
// Fake Data
static func allRooms() -> [Room] {
  return [
 Room(name: "Living Room", imageBackground: #imageLiteral(resourceName: "livingroom"), numberOfdevices: 9),
 Room(name: "Media Room", imageBackground: #imageLiteral(resourceName: "mediaroom"), numberOfdevices: 6),
 Room(name: "Bathroom", imageBackground: #imageLiteral(resourceName: "bathroom"), numberOfdevices: 1),
 Room(name: "Bedroom", imageBackground: #imageLiteral(resourceName: "bedroom"), numberOfdevices: 3)

  ]
}


}
