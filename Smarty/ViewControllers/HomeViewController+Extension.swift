//
//  HomeViewController+Extension.swift
//  Smarty
//
//  Created by MohamedNouri on 30/07/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import UIKit
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
