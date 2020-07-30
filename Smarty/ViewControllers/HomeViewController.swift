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

        

        // add Data
        
     
         self.title = "Smarty"
 
     }
    

 
 
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true 
    }
    
    
    
}




extension HomeViewController : UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
              // #warning Incomplete implementation, return the number of items
           return roomsData.count
          }

            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
              guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCellId, for: indexPath) as? HomeCollectionViewCell else {
                  fatalError("No cell with this name ")
              }
               
               
               cell.roomData = roomsData[indexPath.row]
              // Configure the cell
          
              return cell
          }
       
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let roomDVC = RoomDetailViewController()
        roomDVC.room = roomsData[indexPath.row]

         self.navigationController?.pushViewController(roomDVC, animated: true)
     }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
       
            return CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width, height: cellH)
       
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
           
           
               return .init(width: view.frame.width, height: HeaderH)
         
           
       }
    
    
 
    
    
      func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
           
        
          switch kind {
            // 2
            case UICollectionView.elementKindSectionHeader:
              // 3
              guard
                let headerView = collectionView.dequeueReusableSupplementaryView(
                  ofKind: kind,
                  withReuseIdentifier: Headerid,
                  for: indexPath) as? HeaderView
                else {
                  fatalError("Invalid view type")
              }

             

              if let username =  UserDefaults.standard.getUserName(){
               //TODO: Display the name written on the first screen.
                headerView.userNameLabel.text = ("Welcome \(username) !")
                
                 //TODO: Display of the currently formatted date.
                headerView.dateLabel.text = Date.getCurrentDate()
                    }
 
              return headerView
            default:
              // 4
              assert(false, "Invalid element type")
            }
       }
    
    
 
    
    
       
}
