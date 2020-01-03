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
        self.title = "検索リスト"
        
        //declare detail of tableview
        table = {
           let tb = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            tb.delegate = self
            tb.dataSource = self
            tb.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            return tb
        }()
        self.view.addSubview(table)
        
        let rightBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tap(_:)))
        self.navigationItem.rightBarButtonItem = rightBtn
        let leftBtn = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editenable(_:)))
        self.navigationItem.leftBarButtonItem = leftBtn
    }
    
    @objc func editenable(_ sender: UIBarButtonItem) {
        table.isEditing = !table.isEditing
    }
    
    @objc func tap(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "searchword", message: "お気に入りにしたい検索ワード", preferredStyle: .alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{ (action: UIAlertAction!) -> Void in
                print("OK")

            guard let textFields = alert.textFields, !textFields.isEmpty else { return }
            
            let newseach = Search()
            newseach.word = textFields[0].text!
            self.vmList.save(new: newseach)
            self.table.reloadData()
            
        })
        // キャンセルボタン
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{ (action: UIAlertAction!) -> Void in
                print("Cancel")
        })
        
        alert.addTextField(configurationHandler: {(text: UITextField!) -> Void  in
            text.tag = 3
        })
        
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)

        present(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //when return here from other VC, refresh tableview
        table.reloadData()
    }
    
    private func webappear(_ word: String) {
        let browser = BrowserView()
        browser.vmBrowser.word = word
        browser.modalPresentationStyle = .fullScreen
        present(browser, animated: true, completion: nil)
//        navigationController?.pushViewController(browser, animated: true)
//        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        navigationItem.backBarButtonItem = backButtonItem
//        navigationController?.interactivePopGestureRecognizer!.isEnabled = false
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        webappear((tableView.cellForRow(at: indexPath)?.textLabel!.text)!)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    //スワイプしたセルを削除　※arrayNameは変数名に変更してください
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            if let pickup = self.vmList.pickup(index: indexPath.row) {
                vmList.delete(at: pickup)
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        vmList.move(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vmList.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel!.text = vmList.pickupword(index: indexPath.row)
        return cell!
    }
    
}
