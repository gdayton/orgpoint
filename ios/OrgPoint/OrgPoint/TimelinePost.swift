//
//  TimelinePost.swift
//  OrgPoint
//
//  Created by Jose Calles on 2/29/16.
//  Copyright © 2016 Jose Calles. All rights reserved.
//

import Foundation
import UIKit

struct TimelinePost {
    var user: String
    var time: String
    var content: String
    var image: UIImage
    
    
    init(user: String, time: String, content: String, image: UIImage){
        self.user = user
        self.time = time
        self.content = content
        self.image = image 
    }
}
