//
//  ViewController.swift
//  Friends
//
//  Created by Abraham Isaac Durán on 9/6/16.
//  Copyright © 2016 Abraham Durán. All rights reserved.
//

import UIKit

class FollowFriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var friendsListTableView: UITableView!
    var friendsList: [FriendsList]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        friendsListTableView.dataSource = self
        friendsListTableView.delegate = self
        
        let addressBookContacts: [Friend] = [
            Friend(name: "Markus Feehily"),
            Friend(name: "Kelly Egan", isFriend: true)
        ]
        
        let facebookContacts: [Friend] = [
            Friend(name: "Shane Filan"),
            Friend(name: "Markus"),
            Friend(name: "Derrick Lacey")
        ]
        
        let twitterContacts: [Friend] = [
            Friend(name: "Led Zeppelin"),
            Friend(name: "Johh Lenon"),
            Friend(name: "Pink Floyd")
        ]
        
       friendsList = [
            FriendsList(source: "Address Book", friends: addressBookContacts),
            FriendsList(source: "Facebook", friends: facebookContacts),
            FriendsList(source: "Twitter", friends: twitterContacts)
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return friendsList.count
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header: CollapsibleTableViewHeader = tableView.dequeueReusableCellWithIdentifier("headerCell") as! CollapsibleTableViewHeader
        let header: FriendHeaderTableViewCell = tableView.dequeueReusableHeaderFooterViewWithIdentifier("headerCell") as! FriendHeaderTableViewCell
//
//        header.toggleButton.tag = section
//        header.imageHeader.image = UIImage(named: "default.png")
        header.nameLabel.text = "Some Text"
        
        return header.contentView
    }

    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return friendsList[section].friends.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let friend = friendsList[indexPath.section].friends[indexPath.row]
        
        let friendCell: FriendTableViewCell = tableView.dequeueReusableCellWithIdentifier("friendCell", forIndexPath: indexPath) as! FriendTableViewCell
        friendCell.nameLabel.text = friend.name
        friendCell.friendSwitch.on = friend.isFriend!
        let image: UIImage = UIImage(named: friend.profilePicturePath!)!
//        friendCell.profilePicture = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        
//        friendCell.profilePicture.layer.masksToBounds = false
//        friendCell.profilePicture.layer.cornerRadius = friendCell.profilePicture.frame.size.width / 2
//        friendCell.profilePicture.clipsToBounds = true
        friendCell.profilePicture.image = image
        return friendCell
    }
}

