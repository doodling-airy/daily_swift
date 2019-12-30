//
//  ViewController.swift
//  starbrowser
//
//  Created by airy on 2019/12/27.
//  Copyright © 2019 airy. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    
    
    private var table: UITableView!
    let vmList = viewmodel_List()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //declare detail of tableview
        table = {
           let tb = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            tb.delegate = self
            tb.dataSource = self
            tb.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            return tb
        }()
        self.view.addSubview(table)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //when return here from other VC, refresh tableview
        table.reloadData()
    }
    
    private func webappear(_ word: String) {
        let webview = BrowserView()
        webview.word = word
        present(webview, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        webappear((tableView.cellForRow(at: indexPath)?.textLabel!.text)!)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vmList.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel!.text = vmList.pickuplist(index: indexPath.row)
        return cell!
    }
    
}
