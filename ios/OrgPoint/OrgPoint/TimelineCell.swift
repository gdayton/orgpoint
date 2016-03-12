//
//  TimelineCell.swift
//  OrgPoint
//
//  Created by Jose Calles on 2/29/16.
//  Copyright © 2016 Jose Calles. All rights reserved.
//

import UIKit

class TimelineCell: UITableViewCell {

    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var timeAgo: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    
    func configureCell(post: TimelinePost){
        content.text = post.content
        userName.text = post.user
        timeAgo.text = post.time
        userImage.image = post.image
    }


}
