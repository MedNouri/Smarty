//
//  HomeCollectionViewCell.swift
//  Smarty
//
//  Created by MohamedNouri on 29/07/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    
    let backGroundImage: UIView = {
        let bg = UIView()
        bg.clipsToBounds = false
        bg.backgroundColor = .clear
        return bg
    }()
    
    
    let roomImage: UIImageView = {
        let bg = UIImageView()
        bg.layer.cornerRadius = 6
        bg.clipsToBounds = true
        bg.contentMode = .scaleAspectFill
        return bg
    }()
    
    
    
    let RoomNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Home Room "
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 23.0)
        label.numberOfLines = 1
        label.textColor = .SmartyWhiteColor
        
        return label
    }()
    
    let NbDeviceLabel: UILabel = {
        let label = UILabel()
        label.text = "0 device"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 13.0)
        label.textColor = .SmartyWhiteColor
        return label
    }()
    
    
    
    let LabelsStackView : UIStackView = {
        let sb = UIStackView()
        sb.spacing = 3
        sb.axis = .vertical
        sb.distribution = .fillProportionally
        return sb
    }()
    
    
    
    
    
    
    var roomData:Room? {
        
        didSet{
            
            
            guard let room = roomData else {return}
            
            
            NbDeviceLabel.text = "\(room.numberOfdevices)  " + (room.numberOfdevices > 1 ?  "Devices" : "Device")
            RoomNameLabel.text = room.name
            roomImage.image = room.imageBackground
        }
        
        
        
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backGroundImage.layer.shadowColor = UIColor.black.cgColor
        backGroundImage.layer.shadowOpacity = 1
        let shadowSize: CGFloat = 10
        let contactRect = CGRect(x: shadowSize - 10, y: backGroundImage.frame.height  , width: backGroundImage.frame.width - 20  , height: shadowSize)
        backGroundImage.layer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
        backGroundImage.layer.shadowRadius = 5
        backGroundImage.layer.shadowOpacity = 0.5
    }
    
    
    
    func addViews(){
        addSubview(backGroundImage)
        backGroundImage.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10), size: .zero)
        backgroundColor = .clear
        
        
        
        
        
        
        
        
        //layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        
        
        backGroundImage.addSubview(roomImage)
        roomImage.fillSuperview()
        
        backGroundImage.addSubview(LabelsStackView)
        
        LabelsStackView.anchor(top: nil, leading: backGroundImage.leadingAnchor, bottom: backGroundImage.bottomAnchor, trailing: backGroundImage.trailingAnchor, padding: .init(top: 0, left: 10, bottom: 10, right: 10), size: .zero)
        LabelsStackView.addArrangedSubview(RoomNameLabel)
        LabelsStackView.addArrangedSubview(NbDeviceLabel)
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    
}
