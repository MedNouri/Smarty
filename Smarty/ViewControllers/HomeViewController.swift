//
//  HomeViewController.swift
//  Smarty
//
//  Created by MohamedNouri on 29/07/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import UIKit

let HomeCellId = "homeCell"
let Headerid = "headerid"

fileprivate let padding: CGFloat = 8

class HomeViewController: UIViewController,UICollectionViewDelegateFlowLayout {
     
    let cellH:CGFloat = 190
    let HeaderH:CGFloat = 70
    
    
    // data source
    var roomsData = [Room]()
    
  
    
  
    var Roomcollectionview: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
                view.backgroundColor = .SmartyWhiteColor
        // set Date
   
           roomsData.append(contentsOf: Room.allRooms())
        
        
        
       //TODO: Display the list of rooms.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
 
        layout.scrollDirection = .vertical
        Roomcollectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
     
        Roomcollectionview.dataSource = self
        Roomcollectionview.delegate = self
        Roomcollectionview.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCellId)
        Roomcollectionview.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Headerid)
         Roomcollectionview.contentInsetAdjustmentBehavior = .automatic
        Roomcollectionview.showsVerticalScrollIndicator = false
        Roomcollectionview.translatesAutoresizingMaskIntoConstraints = false
        Roomcollectionview.backgroundColor = .clear
        self.view.addSubview(Roomcollectionview)
        Roomcollectionview.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left:0, bottom: 0, right: 0), size: .zero)
        Roomcollectionview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)

      
     }
    

 
 
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true 
    }
    
    
    
}













