//
//  AddPostController.swift
//  OrgPoint
//
//  Created by Jose Calles on 3/3/16.
//  Copyright © 2016 Jose Calles. All rights reserved.
//

import UIKit

class AddPostController: UIViewController {

    @IBOutlet weak var popupView : UIView!
    @IBOutlet weak var postEdit : UITextField!
    var delegate : AddPostDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popupView.layer.cornerRadius = 10
        popupView.layer.borderColor = UIColor.blackColor().CGColor
        popupView.layer.borderWidth = 0.25
        popupView.layer.shadowColor = UIColor.blackColor().CGColor
        popupView.layer.shadowOpacity = 0.6
        popupView.layer.shadowRadius = 15
        popupView.layer.shadowOffset = CGSize(width: 5, height: 5)
        popupView.layer.masksToBounds = false


    }
    
    override func viewDidAppear(animated: Bool) {
        postEdit.becomeFirstResponder()
    }


    @IBAction func onPostButtonPressed(sender: AnyObject) {
        guard let postText = self.postEdit.text where !postText.isEmpty else {
            print("Please add something to post")
            return
        }
        if let delegate = self.delegate {
            delegate.controller(self, didAddItem: postText)
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}


protocol AddPostDelegate {
    func controller(controller: AddPostController, didAddItem: String)
}
