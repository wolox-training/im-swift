//
//  LibraryController.swift
//  WBooks
//
//  Created by Nacho Mendez on 04/08/2021.
//

import UIKit

class LibraryController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private lazy var library: LibraryView = LibraryView()
    
    override func loadView() {
        view = library
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        library.tableBooks.delegate = self
        library.tableBooks.dataSource = self
        
        let nib = UINib.init(nibName: "MyCustomCell", bundle: nil)
        self.library.tableBooks.register(nib, forCellReuseIdentifier: "MyCustomCell")
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
            cell.lblFirst.text = dict["first_name"]
            cell.lblSecond.text = dict["last_name"]
            cell.layer.cornerRadius = 5
            cell.clipsToBounds = true
            
            return cell
        }
    
    var usersArray : Array = [["first_name": "michael", "last_name": "jackson"], ["first_name" : "bill", "last_name" : "gates"], ["first_name" : "steve", "last_name" : "jobs"], ["first_name" : "mark", "last_name" : "zuckerberg"], ["first_name" : "anthony", "last_name" : "quinn"]]
}

