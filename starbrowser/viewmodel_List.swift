//
//  viewmodel-List.swift
//  starbrowser
//
//  Created by airy on 2019/12/27.
//  Copyright © 2019 airy. All rights reserved.
//

import Foundation
import RealmSwift

final class viewmodel_List {
//    let list = ["sota", "akane"]
    let SearchListModel = SearchList()
    
    
    func all() -> List<Search> {
        return SearchListModel.allList()
    }
    
    func pickupword(index: Int) -> String {
        return SearchListModel.pickupListword(index)
    }
    
    func pickup(index: Int) -> Search {
        return SearchListModel.pickupList(index)
    }
    
    func count() -> Int {
        return SearchListModel.countList()
    }
    
    func save(new: Search) {
        SearchListModel.appendToList(newSearch: new)
    }
    
    func delete(at: Search) {
        SearchListModel.deleteList(search: at)
    }
    
    func move(search: Search, from: Int, to: Int) {
        SearchListModel.moveList(search: search, fromat: from, toat: to)
    }
}
