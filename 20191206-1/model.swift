//
//  model.swift
//  20191206
//
//  Created by airy on 2019/12/06.
//  Copyright © 2019 airy. All rights reserved.
//

import Foundation
import RealmSwift


class User : Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
}

func namechange(name: String) -> String{
    return "irube" + name
}
