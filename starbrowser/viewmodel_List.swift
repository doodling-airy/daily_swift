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
    func check() -> [String] {
        return list
    }
    
    func count() -> Int {
        return list.count
    }
}
