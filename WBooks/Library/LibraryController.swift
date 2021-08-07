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
    
    private let libraryViewModel = LibraryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NavigationBar
        configurationNavigationBar()
        
        // delegates and data source
        library.tableBooks.delegate = self
        library.tableBooks.dataSource = self
        
        // cell .xib
        let nib = UINib.init(nibName: "MyCustomCell", bundle: nil)
        library.tableBooks.register(nib, forCellReuseIdentifier: "MyCustomCell")
    }
    
    // func for the NavigationBar config
    func configurationNavigationBar() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Navigation baric_search"), style: .done, target: self, action: nil)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Navigation baric_notifications"), style: .done, target: self, action: nil)
        
        let imageBackground = UIImage(named: "bc_nav bar")
        navigationController?.navigationBar.setBackgroundImage(imageBackground, for: .default)
        
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
        //navigationController?.title = "LIBRARY"
        
        //title = "LIBRARY"
        title = NSLocalizedString("TITLE_NAVBAR", comment: "")
        tabBarItem.title = "Library"
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    // func for tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return libraryViewModel.numberOfBook
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

        let viewModel = libraryViewModel.getCell(index: indexPath.section)
        cell.configureCell(with: viewModel)
        
        return cell
    }
}

