//
//  viewmodel-List.swift
//  starbrowser
//
//  Created by airy on 2019/12/27.
//  Copyright © 2019 airy. All rights reserved.
//

import Foundation

final class viewmodel_List {
    let list = ["sota", "akane"]
    
    func alllist() -> [String] {
        return list
    }
    
    func pickuplist(index: Int) -> String {
        return list[index]
    }
    
    func count() -> Int {
        return list.count
    }
}
