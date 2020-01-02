//
//  view_Browser.swift
//  starbrowser
//
//  Created by airy on 2019/12/27.
//  Copyright © 2019 airy. All rights reserved.
//

import Foundation
import WebKit
import UIKit

class BrowserView: UIViewController {
    
    
    var wkview: WKWebView!
    let vmBrowser = BrowserViewmodel()
    var begin: CGFloat = CGFloat(0)
    //var begin: CGFloat?
    var barleftop: CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        barleftop = navigationController?.navigationBar.frame.origin.y
        self.view.backgroundColor = .white
        
        
        wkview = WKWebView(frame: CGRect(x: 0, y: -44, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 44))
        //wkview = WKWebView()
        wkview.scrollView.delegate = self
        wkview.allowsBackForwardNavigationGestures = true
        urlrequest()
        
        wkview.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(wkview)
        
        //wkview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        
    }


    
    
    func urlrequest() {
        let url = vmBrowser.initial()
        let urlreq = URLRequest(url: url)
        wkview.load(urlreq)
    }
}

extension BrowserView: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        begin  = scrollView.contentOffset.y;
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let end = scrollView.contentOffset.y
        
        guard abs(begin - end) > 120 else { return }
        
        if begin < end { //down
            UIView.animate(withDuration: 0.3, animations: {
                self.navigationController?.navigationBar.frame.origin.y = -(self.navigationController?.navigationBar.frame.height)!
            })
            self.wkview.frame.origin.y = self.barleftop
//            self.wkview.frame.size.height = self.wkview.frame.height + self.barleftop
            
        } else { //up
            UIView.animate(withDuration: 0.1, animations: {
                self.navigationController?.navigationBar.frame.origin.y = self.barleftop
            })
//            self.wkview.frame.origin.y = (self.navigationController?.navigationBar.frame.height)!
//            self.wkview.frame.size.height = self.wkview.frame.height - (self.navigationController?.navigationBar.frame.height)!
//            print(self.wkview.frame.minY)
        }
    }
}
