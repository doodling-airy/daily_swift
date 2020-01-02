//
//  viewmodel_Browser.swift
//  starbrowser
//
//  Created by airy on 2020/01/02.
//  Copyright © 2020 airy. All rights reserved.
//

import Foundation

class BrowserViewmodel {
    
    let browsermodel = BrowserModel()
    var word: String?
    
    func initial() -> URL {
        return browsermodel.initurl(word)
    }
}
