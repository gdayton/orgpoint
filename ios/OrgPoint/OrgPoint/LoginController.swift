//
//  LoginController.swift
//  OrgPoint
//
//  Created by Jose Calles on 2/22/16.
//  Copyright © 2016 Jose Calles. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var emailEdit: UITextField!
    @IBOutlet weak var passwordEdit: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailEdit.delegate = self
        passwordEdit.delegate = self
    }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }

    
    @IBAction func loginPressed(sender: AnyObject){
        performSegueWithIdentifier(SEG_LOGIN_TO_HOME, sender: nil)
    }

}
