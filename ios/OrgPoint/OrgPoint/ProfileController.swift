//
//  ProfileController.swift
//  OrgPoint
//
//  Created by Jose Calles on 2/18/16.
//  Copyright © 2016 Jose Calles. All rights reserved.
//

import UIKit
import Alamofire



class ProfileController: UIViewController {

    @IBOutlet weak var userImage : UIImageView!
    @IBOutlet weak var role : UILabel!
    @IBOutlet weak var location : UILabel!
    @IBOutlet weak var aboutText : UITextView!
    @IBOutlet weak var respText : UITextView!
    @IBOutlet weak var userName : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = "Jose Calles"
        location.text = "Santa Cruz, CA"
        role.text = "Lead Mobile Developer"
        aboutText.text = "I have three years working at OrgPoint. I love this job. Life's good."
        respText.text = "Head honcho on the Android and iOS team" 
        userImage.image = UIImage(named: "jose")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
