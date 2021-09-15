//
//  LibraryControllerPro.swift
//  WBooks
//
//  Created by ignacio.mendez on 11/09/2021.
//

import Foundation
import UIKit

final class LibraryControllerPro: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let libraryViewModel = LibraryViewModel()
    
    lazy var libraryViewPro: LibraryViewPro = LibraryViewPro()
    
    override func loadView() {
        view = libraryViewPro
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //config navBar
        configurationNavigationBar()
        
        // delegates and data source
        libraryViewPro.tableView.delegate = self
        libraryViewPro.tableView.dataSource = self
        
        libraryViewPro.tableView.register(LibraryCellPro.self, forCellReuseIdentifier: "LibraryCellPro")
        
        libraryViewModel.getBookRepo() { books in
            self.libraryViewPro.tableView.reloadData()
        }
    }
    
    // MARK: -func for tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return libraryViewModel.numberOfBooks()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryCellPro", for: indexPath) as! LibraryCellPro
        let viewModel = libraryViewModel.getCellViewModel(index: indexPath.section)
        cell.configureCell(with: viewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let bookDetailContainerViewController = BookDetailContainerController(bookDetailPadreViewModel: libraryViewModel.getBookDetailContainerViewModel(index: indexPath.section))
        
        navigationController?.pushViewController(bookDetailContainerViewController, animated: true)
    }
    
    // MARK: -func for the NavigationBar config
    func configurationNavigationBar() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Navigation baric_search"), style: .done, target: self, action: nil)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Navigation baric_notifications"), style: .done, target: self, action: nil)
        
        let imageBackground = UIImage(named: "bc_nav bar")
        navigationController?.navigationBar.setBackgroundImage(imageBackground, for: .default)
        
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
        title = NSLocalizedString("TITLE_NAVBAR", comment: "Title at the top of the Library view")
        tabBarItem.title = "Library"
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        // Set the navbar button back only with arrow
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
