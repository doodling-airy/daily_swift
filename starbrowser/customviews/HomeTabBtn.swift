//
//  HomeTabBtn.swift
//  starbrowser
//
//  Created by airy on 2020/01/03.
//  Copyright © 2020 airy. All rights reserved.
//

import Foundation
import UIKit

final class HomeTabBtn: UIView {
    
    var viewcolor: UIColor = .black
    
    override func draw(_ rect: CGRect) {
        let bz = UIBezierPath()
        print("drawrecr \(rect)")
                
        let ten = rect.maxX / 10
        let twe = rect.maxX / 5
        
        //ue
        bz.move(to: CGPoint(x: rect.minX + ten, y: rect.minY + twe))
        bz.addLine(to: CGPoint(x: rect.maxX - ten, y: rect.minY + twe))
        bz.close()
            
        //naka
        bz.move(to: CGPoint(x: rect.minX + ten, y: rect.midY))
        bz.addLine(to: CGPoint(x: rect.maxX - ten, y: rect.midY))
        bz.close()
              
        //sita
        bz.move(to: CGPoint(x: rect.minX + ten, y: rect.maxY - twe))
        bz.addLine(to: CGPoint(x: rect.maxX - ten, y: rect.maxY - twe))
        bz.close()
            
        
        bz.lineWidth = 3
        bz.lineJoinStyle = .round
            
        viewcolor.setStroke()
        bz.stroke()
    }
}
