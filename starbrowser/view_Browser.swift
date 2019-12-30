//
//  view_Browser.swift
//  starbrowser
//
//  Created by airy on 2019/12/27.
//  Copyright © 2019 airy. All rights reserved.
//

import Foundation
import WebKit

protocol BrowserProtocol {
    func wordset(_ word: String) -> String?
}

class BrowserView: UIViewController {
    
    var word: String?
    
    override func viewDidLoad() {
        
        let wk = WKWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            
        let url = URLRequest(url: fetchurl())
        wk.load(url)
            
        self.view.addSubview(wk)
    }
    
    func fetchurl() -> URL {
        if word != nil {
            if let com = NSURLComponents(string: "https://www.google.com/search"){
                com.queryItems = [
                    URLQueryItem(name: "client", value: "safari"),
                    URLQueryItem(name: "rls", value: "en"),
                    URLQueryItem(name: "q", value: word),
                    URLQueryItem(name: "ie", value: "UTF-8"),
                    URLQueryItem(name: "oe", value: "UTF-8"),
                ]
            return com.url!
            }
        }
        return URL(string: "https://www.google.com")!
            
    }
}
