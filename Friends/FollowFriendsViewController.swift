//
//  ViewController.swift
//  Friends
//
//  Created by Abraham Isaac Durán on 9/6/16.
//  Copyright © 2016 Abraham Durán. All rights reserved.
//

import UIKit

extension UIView {
    func rotate(toValue: CGFloat, duration: CFTimeInterval = 0.2, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.toValue = toValue
        rotateAnimation.duration = duration
        rotateAnimation.removedOnCompletion = false
        rotateAnimation.fillMode = kCAFillModeForwards
        
        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate = delegate
        }
        self.layer.addAnimation(rotateAnimation, forKey: nil)
    }
}

class FollowFriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    struct Section {
        var name: String
        var collapsed: Bool!
        var items: [Friend]!
        
        init(name: String, items: [Friend]){
            self.name = name
            self.collapsed = !(items.count > 0)
            self.items = items
        }
    }

    @IBOutlet weak var friendsListTableView: UITableView!
    @IBOutlet weak var searchField: UISearchBar!
    var dataSource: [Section]!
    var sectionsList: [Section]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        friendsListTableView.dataSource = self
        friendsListTableView.delegate = self
        searchField.delegate = self
        
        let addressBookContacts: [Friend] = [
            Friend(id: 1, name: "Markus Feehily"),
            Friend(id: 2, name: "Kelly Egan", isFriend: true)
        ]
        
        let facebookContacts: [Friend] = [
            Friend(id: 3, name: "Shane Filan"),
            Friend(id: 4, name: "Markus"),
            Friend(id: 5, name: "Derrick Lacey")
        ]
        
        let twitterContacts: [Friend] = [
            Friend(id: 6, name: "Led Zeppelin"),
            Friend(id: 7, name: "Johnhn Lenon"),
            Friend(id: 8, name: "Pink Floyd")
        ]
        
        dataSource = [
            Section(name: "Address Book", items: addressBookContacts),
            Section(name: "Facebook", items: facebookContacts),
            Section(name: "Twitter", items: twitterContacts)
        ]
        
        sectionsList = dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionsList.count
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCellWithIdentifier("header") as! CollapsibleTableViewHeader
        
        header.titleLabel.text = sectionsList[section].name
        header.toggleButton.rotate(sectionsList[section].collapsed! ? 0.0 : CGFloat(M_PI_2))
        header.toggleButton.tag = section
        header.toggleButton.addTarget(self, action: #selector(self.toggleCollapse), forControlEvents: .TouchUpInside)
        
        return header.contentView
    }

    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return (sectionsList[section].collapsed!) ? 0 : sectionsList[section].items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let friend = sectionsList[indexPath.section].items[indexPath.row]
        
        let friendCell: FriendTableViewCell = tableView.dequeueReusableCellWithIdentifier("friendCell", forIndexPath: indexPath) as! FriendTableViewCell
        friendCell.nameLabel.text = friend.name
        friendCell.friendSwitch.on = friend.isFriend!
        friendCell.friendSwitch.tag = friend.id
        friendCell.friendSwitch.addTarget(self, action: #selector(self.followFriend), forControlEvents: .TouchUpInside)
        let image: UIImage = UIImage(named: friend.profilePicturePath!)!
        friendCell.profilePicture.image = image
        return friendCell
    }
    
    func toggleCollapse(sender: UIButton) {
        let section = sender.tag
        
        sectionsList[section].collapsed = !(sectionsList[section].collapsed)
        
        friendsListTableView.reloadSections(NSIndexSet(index: section), withRowAnimation: .Automatic)
    }
    
    func followFriend(sender: UIButton) {
        let friendId = sender.tag
        for source in dataSource {
            for friend in source.items {
                if (friend.id == friendId) {
                    friend.isFriend = true
                    break
                }
            }
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.searchField.endEditing(true)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        var results = [Section]()
        if (!searchText.isEmpty) {
            for source in dataSource {
                var friendResults = [Friend]()
                for friend in source.items {
                    if (friend.name.lowercaseString.containsString(searchText.lowercaseString)) {
                        friendResults.append(friend)
                    }
                }
                results.append(Section(name: source.name, items: friendResults))
            }
            
            sectionsList = results
        } else {
            sectionsList = dataSource
        }
        
        friendsListTableView.reloadData()
    }
}

