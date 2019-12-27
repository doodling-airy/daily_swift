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
        table = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(table)
    }
}

extension ViewController: UITableViewDelegate {
    
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vmList.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel!.text = vmList.check()[indexPath.row]
        return cell!
    }
}
