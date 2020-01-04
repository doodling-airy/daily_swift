//
//  TopListTableCell.swift
//  starbrowser
//
//  Created by airy on 2020/01/03.
//  Copyright © 2020 airy. All rights reserved.
//

import Foundation
import UIKit

class TopListTableCell: UITableViewCell {
    
    let label = UILabel()
    let hometab = HomeTabBtn()
    let squ: CGFloat = 60
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        textLabel?.backgroundColor = .clear
        
        
        
//        hometab.translatesAutoresizingMaskIntoConstraints = false
//        hometab.backgroundColor = .clear
//        addSubview(hometab)
//        hometab.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        hometab.heightAnchor.constraint(equalToConstant: squ).isActive = true
//        hometab.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        hometab.widthAnchor.constraint(equalToConstant: squ).isActive = true
//        //hometab.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        label.contentMode = .scaleAspectFit
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  20).isActive = true
        //label.heightAnchor.constraint(equalToConstant: squ).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        //label.trailingAnchor.constraint(equalTo: hometab.leadingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label.textColor = .black
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
