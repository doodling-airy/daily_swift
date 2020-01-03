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
    var topbar: UIView!
    let vmBrowser = BrowserViewmodel()
    var begin: CGFloat = CGFloat(0)
    var barleftop: CGFloat!
    
    var wkdefaulttop: NSLayoutConstraint!
    var wkfulltop: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        topbar = UIView()
        topbar.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 231/255, alpha: 1)
        topbar.translatesAutoresizingMaskIntoConstraints = false //to use constraint
        self.view.addSubview(topbar)
        
        wkview = WKWebView()
        wkview.scrollView.delegate = self
        wkview.allowsBackForwardNavigationGestures = true
        wkview.translatesAutoresizingMaskIntoConstraints = false //to use constraint
        urlrequest()
        self.view.addSubview(wkview)
        
        topbar.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        topbar.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.12).isActive = true
        
        wkview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        topbar.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        wkview.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        wkdefaulttop = wkview.topAnchor.constraint(equalTo: topbar.bottomAnchor)
        wkdefaulttop.isActive = true
        wkfulltop = wkview.topAnchor.constraint(equalTo: self.view.topAnchor)
        wkfulltop.isActive = false
        
        barleftop = topbar.frame.minY
        
        let homeBtn = UIButton(type: .close)
        homeBtn.backgroundColor = .clear
        homeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        homeBtn.addTarget(self, action: #selector(dismissself(_:)), for: .touchUpInside)
        homeBtn.tintColor = .blue
        homeBtn.translatesAutoresizingMaskIntoConstraints = false //to use constraint
        topbar.addSubview(homeBtn)
        
        homeBtn.topAnchor.constraint(equalTo: self.topbar.topAnchor, constant: 20).isActive = true
        homeBtn.heightAnchor.constraint(equalTo: self.topbar.heightAnchor, constant: -20).isActive = true
        homeBtn.trailingAnchor.constraint(equalTo: self.topbar.trailingAnchor).isActive = true
        homeBtn.widthAnchor.constraint(equalTo: self.topbar.heightAnchor, constant: -20).isActive = true
        
        
        
        let addBtn = UIButton(type: .contactAdd)
        addBtn.backgroundColor = .clear
        addBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        addBtn.addTarget(self, action: #selector(dismissself(_:)), for: .touchUpInside)
        addBtn.tintColor = .blue
        addBtn.translatesAutoresizingMaskIntoConstraints = false //to use constraint
        topbar.addSubview(addBtn)
        
        addBtn.topAnchor.constraint(equalTo: self.topbar.topAnchor, constant: 20).isActive = true
        addBtn.heightAnchor.constraint(equalTo: self.topbar.heightAnchor, constant: -20).isActive = true
        addBtn.leadingAnchor.constraint(equalTo: self.topbar.leadingAnchor).isActive = true
        addBtn.widthAnchor.constraint(equalTo: self.topbar.heightAnchor, constant: -20).isActive = true
        
    }

    @objc func dismissself(_ sender: UIButton) {
        if let superview = self.presentingViewController {
            superview.dismiss(animated: true, completion: nil)
        }
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

        guard abs(begin - end) > 80 else { return }
        
        if begin < end { //down
            self.wkdefaulttop.isActive = false
            self.wkfulltop.isActive = true
            UIView.animate(withDuration: 0.3, animations: {
                self.topbar.frame.origin.y = -self.topbar.frame.height
                self.view.layoutIfNeeded()
            })

        } else { //up
            self.wkfulltop.isActive = false
            self.wkdefaulttop.isActive = true
            UIView.animate(withDuration: 0.1, animations: {
                self.topbar.frame.origin.y = self.barleftop
                self.view.layoutIfNeeded()
                
            })
        }
        
    }
}
