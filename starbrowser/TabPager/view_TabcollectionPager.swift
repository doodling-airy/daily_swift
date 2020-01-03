//
//  view_TabcollectionPager.swift
//  starbrowser
//
//  Created by airy on 2020/01/03.
//  Copyright © 2020 airy. All rights reserved.
//

import Foundation
import UIKit

class TabcollectionPager: UIViewController {
    
    let array = ["a", "b", "c","a", "b", "c","a", "b", "c","a", "b", "c","a", "b", "c","a", "b", "c","a", "b", "c","a", "b", "c","a", "b", "c","a", "b", "c","a", "b", "c","a", "b", "c","a", "b", "c"]
    
    override func viewDidLoad() {
        let collectionView: UICollectionView = {
            //セルのレイアウト設計
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

            //各々の設計に合わせて調整
            layout.scrollDirection = .vertical
            //layout.minimumInteritemSpacing = 10 //yoko
            //layout.minimumLineSpacing = 10 // tate
            layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)

            let collectionView = UICollectionView( frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), collectionViewLayout: layout)
            collectionView.backgroundColor = UIColor.white
            //セルの登録
            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
            return collectionView
        }()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.view.addSubview(collectionView)
    }
}

extension TabcollectionPager: UICollectionViewDelegate {
    
}


extension TabcollectionPager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .black
        return cell
    }
    
    
}

extension TabcollectionPager: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

      //ここでは画面の横サイズの半分の大きさのcellサイズを指定
    let horizontalSpace : CGFloat = 10
    let cellSize : CGFloat = self.view.bounds.width / 2 - horizontalSpace
    
    return CGSize(width: cellSize, height: cellSize)
  }
}
