//
//  view_ConfigTable.swift
//  starbrowser
//
//  Created by airy on 2020/01/04.
//  Copyright © 2020 airy. All rights reserved.
//

import Foundation
import UIKit

class ConfigTable: UIViewController {
    
    let vmConfig = viewmodelConfig()
    
    let configTable: UITableView = {
        let tb = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        //tb.delegate = self
        //tb.dataSource = self
        tb.register(ConfigTableCell.self, forCellReuseIdentifier: "cell")
        return tb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable.delegate = self
        configTable.dataSource = self
        
        self.view.addSubview(configTable)
    }

}

extension ConfigTable: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ConfigTable: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ConfigTableCell
        
        cell.textLabel!.text = (vmConfig.attribute[0][0] as! String)
        cell.configAttribute = (vmConfig.attribute[0][1] as! Config)
        
        switch cell.configAttribute {
        case .colorchange:
            print("color")
        default:
            print("no need")
        }
        
        return cell
    }
}
