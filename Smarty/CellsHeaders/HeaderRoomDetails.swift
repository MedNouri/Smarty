//
//  headerRoomDetails.swift
//  Smarty
//
//  Created by MohamedNouri on 30/07/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import UIKit
class HeaderRoomDetails: UICollectionReusableView {
    
    
    // MARK: Views
    let rootStackView : UIStackView = {
        let sb = UIStackView()
        sb.spacing = 6
        sb.axis = .horizontal
        sb.distribution = .fillEqually
        return sb
    }()
    
    
    let VrootStackView1 : UIStackView = {
        let sb = UIStackView()
        sb.spacing = 6
        sb.axis = .vertical
        sb.distribution = .fillEqually
        return sb
    }()
    let VrootStackView2 : UIStackView = {
        let sb = UIStackView()
        sb.spacing = 6
        sb.axis = .vertical
        sb.distribution = .fillEqually
        return sb
    }()
    
    let lightV: UIView = {
        let bg = UIView()
        bg.clipsToBounds = false
        bg.backgroundColor = .SmartyWhiteColor
        bg.layer.cornerRadius = 8
        bg.layer.borderColor = UIColor.lightGray.cgColor
            bg.layer.borderWidth = 1.0
        return bg
    }()
    let ligth: UILabel = {
        let label = UILabel()
        label.text = "50 % 💡"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.numberOfLines = 1
        label.textColor = .SmartyBlackColor
        
        return label
    }()
    
    
    
    let tempV: UIView = {
        let bg = UIView()
        bg.clipsToBounds = false
        bg.backgroundColor = .SmartyWhiteColor
        bg.layer.cornerRadius = 8
        bg.layer.borderColor = UIColor.lightGray.cgColor
            bg.layer.borderWidth = 1.0
        return bg
    }()
    
    let temperature: UILabel = {
        let label = UILabel()
        label.text = "73° 🌡"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.numberOfLines = 1
        label.textColor = .SmartyBlackColor
        
        return label
    }()
    
    
    
    let windoV: UIView = {
        let bg = UIView()
        bg.clipsToBounds = false
        
        bg.backgroundColor = .SmartyWhiteColor
        bg.layer.cornerRadius = 8
        bg.layer.borderColor = UIColor.lightGray.cgColor
            bg.layer.borderWidth = 1.0
        return bg
    }()
    
    
    let windowopen: UILabel = {
        let label = UILabel()
        label.text = " TV  📺"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.numberOfLines = 1
        label.textColor = .SmartyBlackColor
        
        return label
    }()
    
    
    
    
    let doorV: UIView = {
        let bg = UIView()
        bg.clipsToBounds = false
       bg.backgroundColor = .SmartyWhiteColor
             bg.layer.cornerRadius = 8
        bg.layer.borderColor = UIColor.lightGray.cgColor
        bg.layer.borderWidth = 1.0
        return bg
    }()
    
    
    
    let dooropen: UILabel = {
        let label = UILabel()
        label.text = " Door 🚪"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.numberOfLines = 1
        label.textColor = .SmartyBlackColor
        
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    
    // MARK: setting views 
    func addViews(){
        
        addSubview(rootStackView)
        rootStackView.fillSuperview(padding: .init(top: 5, left: 5, bottom: 5, right: 5))
        rootStackView.addArrangedSubview(VrootStackView1)
        rootStackView.addArrangedSubview(VrootStackView2)
        
        VrootStackView1.addArrangedSubview(lightV)
        lightV.addSubview(ligth)
        ligth.translatesAutoresizingMaskIntoConstraints = false
        ligth.centerYAnchor.constraint(equalTo: lightV.centerYAnchor).isActive = true
        ligth.centerXAnchor.constraint(equalTo: lightV.centerXAnchor).isActive = true
        VrootStackView1.addArrangedSubview(tempV)
        tempV.addSubview(temperature)
        temperature.translatesAutoresizingMaskIntoConstraints = false
        temperature.centerYAnchor.constraint(equalTo: tempV.centerYAnchor).isActive = true
        temperature.centerXAnchor.constraint(equalTo: tempV.centerXAnchor).isActive = true
        
        VrootStackView2.addArrangedSubview(windoV)
        windoV.addSubview(windowopen)
        windowopen.translatesAutoresizingMaskIntoConstraints = false
        windowopen.centerYAnchor.constraint(equalTo: windoV.centerYAnchor).isActive = true
        windowopen.centerXAnchor.constraint(equalTo: windoV.centerXAnchor).isActive = true
        
        
        
        VrootStackView2.addArrangedSubview(doorV)
        
        doorV.addSubview(dooropen)
        dooropen.translatesAutoresizingMaskIntoConstraints = false
        dooropen.centerYAnchor.constraint(equalTo: doorV.centerYAnchor).isActive = true
        dooropen.centerXAnchor.constraint(equalTo: doorV.centerXAnchor).isActive = true
        
        
        
        
        
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}



