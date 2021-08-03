//
//  ViewController2.swift
//  WBooks
//
//  Created by Nacho Mendez on 02/08/2021.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblUser: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "MyCustomCell", bundle: nil)
        self.tblUser.register(nib, forCellReuseIdentifier: "MyCustomCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.usersArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath) as! MyCustomCell
        
        let dict = usersArray[indexPath.section]
        cell.lblFirstName.text = dict["first_name"]
        cell.lblLastName.text = dict["last_name"]
        cell.layer.cornerRadius = 5
        cell.clipsToBounds = false
        
        return cell
    }
    
    var usersArray : Array = [["first_name": "michael", "last_name": "jackson"], ["first_name" : "bill", "last_name" : "gates"], ["first_name" : "steve", "last_name" : "jobs"], ["first_name" : "mark", "last_name" : "zuckerberg"], ["first_name" : "anthony", "last_name" : "quinn"]]
}
