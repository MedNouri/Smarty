//
//  RoomDetailsCollectionViewCell.swift
//  Smarty
//
//  Created by Startdevelopment on 30/07/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import UIKit

class RoomDetailsCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: Views
let backGroundImage: UIView = {
    let bg = UIView()
    bg.clipsToBounds = false
    bg.backgroundColor = .white
    return bg
}()


 



let devideName: UILabel = {
    let label = UILabel()
    label.text = "Device "
    label.textAlignment = .left
    label.font = UIFont.boldSystemFont(ofSize: 20.0)
    label.numberOfLines = 1
    label.textColor = .SmartyBlackColor
    
    return label
}()

let devicelabel: UILabel = {
    let label = UILabel()
    label.text = "on"
    label.textAlignment = .left
    label.numberOfLines = 1
    label.font = UIFont.systemFont(ofSize: 13.0)
    label.textColor = .SmartyGrayColor
    return label
}()



let LabelsStackView : UIStackView = {
    let sb = UIStackView()
    sb.spacing = 3
    sb.axis = .vertical
    sb.distribution = .fillProportionally
    return sb
}()


    let switchdevice : UISwitch = {
        let switchdevice = UISwitch()
        
        return switchdevice
    }()




var deviceData:Device? {
    
    didSet{
        
        
        guard let device = deviceData else {return}
        
        
       
        devideName.text = device.name
        switchdevice.isOn = device.toggle
        devicelabel.text = device.toggle ? "on" : "off"
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
    backGroundImage.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 5, left: 10, bottom: 5, right: 10), size: .zero)
    backgroundColor = .clear
     //layer.shadowPath = UIBezierPath(rect: bounds).cgPath
     
    
    
    backGroundImage.addSubview(LabelsStackView)
    
    LabelsStackView.anchor(top: nil, leading: backGroundImage.leadingAnchor, bottom: backGroundImage.bottomAnchor, trailing: backGroundImage.trailingAnchor, padding: .init(top: 0, left: 10, bottom: 10, right: 10), size: .zero)

    LabelsStackView.addArrangedSubview(devideName)
     LabelsStackView.addArrangedSubview(devicelabel)
    
    backGroundImage.addSubview(switchdevice)
    switchdevice.translatesAutoresizingMaskIntoConstraints = false
    switchdevice.trailingAnchor.constraint(equalTo:backGroundImage.trailingAnchor , constant: -20).isActive = true
    switchdevice.centerYAnchor.constraint(equalTo: backGroundImage.centerYAnchor).isActive = true

}


required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}



}
