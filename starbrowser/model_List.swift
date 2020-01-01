//
//  model_List.swift
//  starbrowser
//
//  Created by airy on 2019/12/27.
//  Copyright © 2019 airy. All rights reserved.
//

import Foundation
import RealmSwift

class Search: Object {
    let uuid = NSUUID().uuidString
    @objc dynamic var word = ""
    
//    override static func primaryKey() -> String? {
//        return "uuid"
//    }
}

class SearchList: Object {
    let list = List<Search>()
    //let list = LinkingObjects(fromType: Search.self, property: "list")
    
    func appendToList(newSearch: Search) {
        guard self.save(newSearch) else { return }
        
        let realm = try! Realm()
        let result = realm.objects(SearchList.self).last
        
        try! realm.write {
            result!.list.append(newSearch)
        }
    }
    private func save(_ newSearch: Search) -> Bool{
        let realm = try! Realm()
        if !newSearch.word.isEmpty {
            try! realm.write {
                realm.add(newSearch)
            }
            return true
        }
        return false
    }
    
    func allList() -> List<Search> {
        let realm = try! Realm()
        let result = realm.objects(SearchList.self).last!
        
        return result.list
    }
    
    func pickupListword(_ index: Int) -> String {
        let realm = try! Realm()
        let result = realm.objects(SearchList.self).last!
        return result.list[index].word
    }
    
    func pickupList(_ index: Int) -> Search {
        let realm = try! Realm()
        let result = realm.objects(SearchList.self).last!
        return result.list[index]
    }
    
    func countList() -> Int {
        let realm = try! Realm()
        if let result: SearchList = realm.objects(SearchList.self).last {
            return result.list.count
        }
        return 0
    }
    
    func deleteList(search: Search) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(search)
        }
    }
    
    func moveList(search: Search, fromat: Int, toat: Int) {
        let realm = try! Realm()
        let result = realm.objects(SearchList.self).last!
        let tmp = search
        try! realm.write {
            result.list.remove(at: fromat)
            result.list.insert(tmp, at: toat)
        }
    }
}
