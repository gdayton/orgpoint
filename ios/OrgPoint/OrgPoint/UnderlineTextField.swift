//
//  UnderlineTextField.swift
//  FiveHundredWords
//
//  Created by Jose Calles on 2/18/16.
//  Copyright © 2016 Jose Calles. All rights reserved.
//

import UIKit

class UnderlineTextField: UITextField {

    override func awakeFromNib() {
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.grayColor().CGColor
        border.frame = CGRectMake(0, frame.size.height - borderWidth, frame.size.width, frame.size.height)
        border.borderWidth = borderWidth
        layer.addSublayer(border)
        layer.masksToBounds = true
    }

}
