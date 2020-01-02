//
//  model_Browser.swift
//  starbrowser
//
//  Created by airy on 2020/01/02.
//  Copyright © 2020 airy. All rights reserved.
//

import Foundation

class BrowserModel {
    func initurl(_ optionword: String?) -> URL {
        guard let word = optionword else { return URL(string: "https://www.google.com")! }
        
        if !word.isEmpty, let com = NSURLComponents(string: "https://www.google.com/search") {
            com.queryItems = [
                URLQueryItem(name: "client", value: "safari"),
                URLQueryItem(name: "rls", value: "en"),
                URLQueryItem(name: "q", value: word),
                URLQueryItem(name: "ie", value: "UTF-8"),
                URLQueryItem(name: "oe", value: "UTF-8"),
            ]
            return com.url!
        }
        return URL(string: "https://www.google.com")!
    }
}
