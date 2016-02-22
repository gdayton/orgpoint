//
//  CircleImage.swift
//  OrgPoint
//
//  Created by Jose Calles on 2/18/16.
//  Copyright © 2016 Jose Calles. All rights reserved.
//

import UIKit

class CircleImage: UIImageView {

    override func awakeFromNib() {
        self.layer.cornerRadius = self.layer.frame.width / 2
        self.clipsToBounds = true
    }

}
