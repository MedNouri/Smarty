//
//  Header.swift
//  Smarty
//
//  Created by MohamedNouri on 30/07/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import UIKit
class HeaderView: UICollectionReusableView {
    
    
    
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "23/23/2020"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 13.0)
        label.numberOfLines = 1
        label.textColor = .SmartyGrayColor
        
        return label
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.numberOfLines = 1
        label.textColor = .SmartyBlackColor
        return label
    }()
    
    
    
    let LabelsStackView : UIStackView = {
        let sb = UIStackView()
        sb.spacing = 6
        sb.axis = .vertical
        sb.distribution = .fillProportionally
        return sb
    }()
    
    
    
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
  
    func addViews(){
        
        
        backgroundColor = .clear
        
        addSubview(LabelsStackView)
        LabelsStackView.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10), size: .zero)
        LabelsStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        LabelsStackView.addArrangedSubview(dateLabel)
        LabelsStackView.addArrangedSubview(userNameLabel)
        
        
        
    }
    
    
    
    
    required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
      
    
    
    
}



