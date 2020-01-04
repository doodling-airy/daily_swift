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
    var containbottom: NSLayoutConstraint!
    var addSearchField: AddSearchTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "検索リスト"
        self.view.backgroundColor = .white
        
        //declare detail of tableview
        table = {
            let tb = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - UIScreen.main.bounds.height*1/10))
            tb.delegate = self
            tb.dataSource = self
            tb.register(TopListTableCell.self, forCellReuseIdentifier: "cell")
            //tb.rowHeight = 100
            //tb.rowHeight = UITableView.automaticDimension
            //tb.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            return tb
        }()
        self.view.addSubview(table)
        
        let containAddSearch = UIView()
        containAddSearch.backgroundColor = .white
        containAddSearch.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(containAddSearch)
        containAddSearch.topAnchor.constraint(equalTo: self.table.bottomAnchor).isActive = true
        containAddSearch.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        containAddSearch.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        containAddSearch.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        //containbottom = containAddSearch.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        //containbottom.isActive = true
        
        
        addSearchField = AddSearchTextField()
        addSearchField.layer.borderWidth = 0.2
        addSearchField.layer.borderColor = UIColor.black.cgColor
        addSearchField.layer.cornerRadius = 23
        addSearchField.layer.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1).cgColor
        addSearchField.translatesAutoresizingMaskIntoConstraints = false
        addSearchField.delegate = self
        containAddSearch.addSubview(addSearchField)
        addSearchField.topAnchor.constraint(equalTo: containAddSearch.topAnchor, constant: 7).isActive = true
        addSearchField.leadingAnchor.constraint(equalTo: containAddSearch.leadingAnchor, constant: 15).isActive = true
        addSearchField.widthAnchor.constraint(equalTo: containAddSearch.widthAnchor, constant: -70).isActive = true
        addSearchField.bottomAnchor.constraint(equalTo: containAddSearch.bottomAnchor, constant: -7).isActive = true

        let addSearchBtn = UIButton(type: .close)
        addSearchBtn.translatesAutoresizingMaskIntoConstraints = false
        addSearchBtn.addTarget(self, action: #selector(tap(_:)), for: .touchUpInside)
        containAddSearch.addSubview(addSearchBtn)
        addSearchBtn.topAnchor.constraint(equalTo: containAddSearch.topAnchor, constant: 5).isActive = true
        addSearchBtn.bottomAnchor.constraint(equalTo: containAddSearch.bottomAnchor, constant: -5).isActive = true
        addSearchBtn.leadingAnchor.constraint(equalTo: addSearchField.trailingAnchor, constant: 5).isActive = true
        addSearchBtn.trailingAnchor.constraint(equalTo: containAddSearch.trailingAnchor, constant: -5).isActive = true
        addSearchBtn.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/4))
        
        let rightBtn = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editenable(_:)))
        self.navigationItem.rightBarButtonItem = rightBtn
        let hamicon = HamburgerIcon(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        hamicon.viewcolor = .systemBlue
        hamicon.backgroundColor = .clear
        let movetohamuburger = UITapGestureRecognizer(target: self, action: #selector(moveham(_:)))
        hamicon.addGestureRecognizer(movetohamuburger)
        let leftBtn = UIBarButtonItem(customView: hamicon)
        //let leftBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tap(_:)))
        self.navigationItem.leftBarButtonItem = leftBtn
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
        self.configureObserver()
    }
    
    @objc func moveham(_ sender: UITapGestureRecognizer) {
        print("this was tap")
        let configview = ConfigTable()
        //configview.modalPresentationStyle = .fullScreen
        //present(configview, animated: false)
        
        
        navigationController?.pushViewController(configview, animated: false)
        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButtonItem
        navigationController?.interactivePopGestureRecognizer!.isEnabled = false
    }
    
    func configureObserver() {
          
      let notification = NotificationCenter.default

      notification.addObserver(
        self,
        selector: #selector(self.keyboardWillShow(notification:)),
        name: UIResponder.keyboardWillShowNotification,
        object: nil
      )
          
      notification.addObserver(
        self,
        selector: #selector(self.keyboardWillHide(notification:)),
        name: UIResponder.keyboardWillHideNotification,
        object: nil
      )
    }
    
    func removeObserver() {
      NotificationCenter.default.removeObserver(self)
    }

    @objc func keyboardWillShow(notification: Notification?) {
        let rect = (notification?.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        print("prepre \((self.navigationController?.navigationBar.frame.height)!)")
        UIView.animate(withDuration: duration!) {
            self.table.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - (rect?.size.height)! - (self.navigationController?.navigationBar.frame.height)! - 20)
            print("preaf \((self.navigationController?.navigationBar.frame.height)!)")
        }
      }
    @objc func keyboardWillHide(notification: Notification?) {
        let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Double
        print("afpre \((self.navigationController?.navigationBar.frame.height)!)")
        UIView.animate(withDuration: duration!) {
            self.table.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - (self.navigationController?.navigationBar.frame.height)! - 16)
            print("afaf \((self.navigationController?.navigationBar.frame.height)!)")
        }
    }
    
    @objc func editenable(_ sender: UIBarButtonItem) {
        table.isEditing = !table.isEditing
    }
    
    @objc func tap(_ sender: UIBarButtonItem) {
        if let newword = self.addSearchField!.text {
            guard !newword.isEmpty else { return }
            let newsearch = Search()
            newsearch.word = newword
            self.vmList.save(new: newsearch)
            self.table.reloadData()
            
            self.addSearchField!.text = ""
            self.addSearchField.resignFirstResponder()
        }
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
        if let word = (tableView.cellForRow(at: indexPath) as! TopListTableCell).label.text {
            webappear(word)
        }
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
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    var rand: CGFloat {
        get {
            CGFloat(Float.random(in: 230 ..< 255)/255)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1// vmList.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TopListTableCell
        cell.label.text = vmList.pickupword(index: indexPath.section)
        cell.backgroundColor = UIColor.init(red: rand, green: rand, blue: rand, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return vmList.count()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
