//
//  viewmodel.swift
//  20191206
//
//  Created by airy on 2019/12/06.
//  Copyright © 2019 airy. All rights reserved.
//

import Foundation
import RealmSwift

class viewmodel : ObservableObject {
    var akane = User()
    @Published var name = ""
    
    let realm = try! Realm()
    
    func initialize() {
        akane.id = 1116
        akane.name = "akane"
        try! realm.write {
            realm.add(akane)
        }
        name = akane.name
    }
    
    func allshow() {
        for i in realm.objects(User.self) {
            print("\(i.name)")
        }
    }
    
    func callchange() {
        akane = realm.objects(User.self).filter("id == 1116").last!
        try! realm.write {
            akane.name = namechange(name: akane.name)
        }
        name = akane.name
    }
    
}
