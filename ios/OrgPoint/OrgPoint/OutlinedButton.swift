//
//  OutlinedButton.swift
//  FiveHundredWords
//
//  Created by Jose Calles on 2/18/16.
//  Copyright © 2016 Jose Calles. All rights reserved.
//

import UIKit

class OutlinedButton: UIButton {


    override func awakeFromNib() {
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 4.0;
        self.layer.borderColor = UIColor.blackColor().CGColor
    }

}
