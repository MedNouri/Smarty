//
//  HomeViewController+Extension.swift
//  Smarty
//
//  Created by MohamedNouri on 30/07/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import UIKit
extension RoomDetailViewController : UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
              // #warning Incomplete implementation, return the number of items
           return DeviceData.count
          }

            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
              guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsCellId, for: indexPath) as? RoomDetailsCollectionViewCell else {
                  fatalError("No cell with this name ")
              }
               
               
               cell.deviceData = DeviceData[indexPath.row]
              // Configure the cell
          
              return cell
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
                  withReuseIdentifier: DetailsHeaderid,
                  for: indexPath) as? HeaderRoomDetails
                else {
                  fatalError("Invalid view type")
              }

             
 
 
              return headerView
            default:
              // 4
              assert(false, "Invalid element type")
            }
       }
    
    
 
    
    
       
}
