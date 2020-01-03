//
//  AddSearchTextField.swift
//  starbrowser
//
//  Created by airy on 2020/01/03.
//  Copyright © 2020 airy. All rights reserved.
//

import Foundation
import UIKit

final class AddSearchTextField: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20.0, dy: 0)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20.0, dy: 0.0)
    }
    //プレースホルダーの余白
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20.0, dy: 0.0)
    }
}
