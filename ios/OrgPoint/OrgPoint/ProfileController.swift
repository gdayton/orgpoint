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
        Alamofire.request(.GET, "\(BASE_URL)/users.json").responseJSON {
            response in
            if let json = response.result.value {
                if let userList = json as? [[String : AnyObject]]{
                    //Just get first user for now 
                    let firstUser = userList[0]
                    if let firstName = firstUser["first_name"] as? String
                        , let lastName = firstUser["last_name"] as? String, let job = firstUser["role"] as? String {
                        self.role.text = job
                        self.userName.text = firstName + " " + lastName
                        self.role.text = job
                    }
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
