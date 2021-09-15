//
//  TabBarController.swift
//  WBooks
//
//  Created by Nacho Mendez on 05/08/2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let library = LibraryController()
        let library = LibraryControllerPro()
        library.tabBarItem = UITabBarItem()
        library.tabBarItem.title = "Library"
        library.tabBarItem.image = UIImage(named: "ic_library active")
        library.tabBarItem.tag = 0
       
        let navLibrary = UINavigationController(rootViewController: library)
    
        
        let wishList = WishListController()
        wishList.tabBarItem = UITabBarItem()
        wishList.tabBarItem.title = "WishList"
        wishList.tabBarItem.image = UIImage(named: "ic_wishlist active")
        wishList.tabBarItem.tag = 1
        
        let navWishList = UINavigationController(rootViewController: wishList)
        
        
        let suggest = SuggestController()
        suggest.tabBarItem = UITabBarItem()
        suggest.tabBarItem.title = "Suggest"
        suggest.tabBarItem.image = UIImage(named: "ic_add new active")
        suggest.tabBarItem.tag = 2
        
        let navSuggest = UINavigationController(rootViewController: suggest)
        
        
        let rentals = RentalsController()
        rentals.tabBarItem = UITabBarItem()
        rentals.tabBarItem.title = "Rentals"
        rentals.tabBarItem.image = UIImage(named: "ic_myrentals active")
        rentals.tabBarItem.tag = 3
        
        let navRentals = UINavigationController(rootViewController: rentals)
        
        viewControllers = [navLibrary, navWishList, navSuggest, navRentals]
    }
}
