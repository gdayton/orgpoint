//
//  TimelineController.swift
//  OrgPoint
//
//  Created by Jose Calles on 2/29/16.
//  Copyright © 2016 Jose Calles. All rights reserved.
//

import UIKit

class TimelineController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddPostDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var posts = [TimelinePost]()
    let dimLevel: CGFloat = 0.5
    let dimSpeed: Double = 0.5

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let post1 = TimelinePost(user: "Glenn Dayton", time: "2 hours ago", content: "Had fun at the Donald Trump rally.", image: UIImage(named: "glenn")!)
        let post2 = TimelinePost(user: "Jose Calles", time: "6 hours ago", content: "Oh em gee last night was so amazing!", image: UIImage(named: "jose")!)
        let post3 = TimelinePost(user: "Jesus Alcaraz", time: "8 hours ago", content: "These 27 units are kicking my butt.", image: UIImage(named: "jesus")!)
        let post4 = TimelinePost(user: "Shivam Dave", time: "Yesterday", content: "My wife and I just had a baby boy!", image: UIImage(named: "shivam")!)
        let post5 = TimelinePost(user: "Joseph Ou", time: "2 days ago", content: "My band killed it last night", image: UIImage(named: "joseph")!)
        let post6 = TimelinePost(user: "Raul Luna", time: "3 hours ago", content: "Happy to announce I am now a part of the Google team!", image: UIImage(named: "raul")!)
        posts.append(post1)
        posts.append(post2)
        posts.append(post3)
        posts.append(post4)
        posts.append(post5)
        posts.append(post6)
        tableView.delegate = self
        tableView.dataSource = self 

    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1; 
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("postCell") as? TimelineCell {
            let post = self.posts[indexPath.row]
            cell.configureCell(post)
            return cell
        } else {
            return TimelineCell()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == SEG_TIMELINE_TO_POST {
            let addController = segue.destinationViewController as? AddPostController
            if let viewController = addController {
                viewController.delegate = self
            }
        }
    }
    
    func controller(controller: AddPostController, didAddItem: String) {
       let newPost = TimelinePost(user: "Jose Calles", time: "Now", content: didAddItem, image: UIImage(named: "jose")!)
        posts.insert(newPost, atIndex: 0)
        tableView.reloadData()
    }
    
 
    
    

}
