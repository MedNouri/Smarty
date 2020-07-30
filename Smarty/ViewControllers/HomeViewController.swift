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
     

    
    var roomsData = [Room]()
    
  
    
  
    var Roomcollectionview: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
                view.backgroundColor = .SmartyWhiteColor
        // set Date
   
           roomsData.append(contentsOf: Room.allRooms())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
      
        layout.scrollDirection = .vertical
        Roomcollectionview = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
       // setupCollectionViewLayout()
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
    

 fileprivate func setupCollectionViewLayout() {
    if let layout = Roomcollectionview.collectionViewLayout as? UICollectionViewFlowLayout {
          layout.sectionInset = .init(top: 0, left: padding, bottom: 0, right: padding)
          layout.sectionInsetReference = .fromSafeArea
      }
  }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
       
            return CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width, height: 200)
       
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
           
           
               return .init(width: view.frame.width, height: 70)
         
           
       }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
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
                headerView.userNameLabel.text = ("Welcome \(username) !")
                headerView.dateLabel.text = Date.getCurrentDate()
                    }
 
              return headerView
            default:
              // 4
              assert(false, "Invalid element type")
            }
       }
    
    
 
    
    
       
}
