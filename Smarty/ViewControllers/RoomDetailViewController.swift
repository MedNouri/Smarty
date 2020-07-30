//
//  RoomDetailViewController.swift
//  Smarty
//
//  Created by MohamedNouri on 29/07/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import UIKit
 

let DetailsCellId = "homeCell"
let DetailsHeaderid = "headerid"

fileprivate let padding: CGFloat = 8

class RoomDetailViewController: UIViewController,UICollectionViewDelegateFlowLayout {
     
    let cellH:CGFloat = 80
    let HeaderH:CGFloat = 220
    
    var DeviceData = [Device]()
    
  
    
  
    var Roomcollectionview: UICollectionView!

    var room:Room?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
          self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
                view.backgroundColor = .SmartyWhiteColor
        // set Date
   
           DeviceData.append(contentsOf: Device.allDevices())
        
       
        navigationController?.navigationBar.prefersLargeTitles = true
               
               guard let room = room else {
                   return
               }
               self.title = room.name
             
        
       //TODO: Display the list of rooms.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
 
        layout.scrollDirection = .vertical
        Roomcollectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
     
        Roomcollectionview.dataSource = self
        Roomcollectionview.delegate = self
        Roomcollectionview.register(RoomDetailsCollectionViewCell.self, forCellWithReuseIdentifier: DetailsCellId)
        Roomcollectionview.register(HeaderRoomDetails.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DetailsHeaderid)
         Roomcollectionview.contentInsetAdjustmentBehavior = .automatic
        Roomcollectionview.showsVerticalScrollIndicator = false
        Roomcollectionview.translatesAutoresizingMaskIntoConstraints = false
        Roomcollectionview.backgroundColor = .clear
        self.view.addSubview(Roomcollectionview)
        Roomcollectionview.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left:0, bottom: 0, right: 0), size: .zero)
        Roomcollectionview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)

        

   // set Home Icon
 

  
 let backBTN = UIBarButtonItem(image: UIImage(systemName: "house"),
                                      style: .plain,
                                      target: navigationController,
                                      action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backBTN
      }
 
}




