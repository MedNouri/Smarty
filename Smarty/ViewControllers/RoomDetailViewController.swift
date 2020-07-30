//
//  RoomDetailViewController.swift
//  Smarty
//
//  Created by MohamedNouri on 29/07/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import UIKit

class RoomDetailViewController: UIViewController {

    
    var room:Room?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 view.backgroundColor = .SmartyWhiteColor
  self.navigationController?.navigationBar.prefersLargeTitles = true
        
        guard let room = room else {
            return
        }
        self.title = room.name
      
     
    }
    

 

    
    
    
 
    
}
