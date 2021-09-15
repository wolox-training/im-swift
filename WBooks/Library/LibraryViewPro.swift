//
//  LibraryViewPro.swift
//  WBooks
//
//  Created by ignacio.mendez on 11/09/2021.
//

import Foundation
import UIKit

final class LibraryViewPro: UIView {
    
    //view for table
    lazy var viewTable: UIView = {
        let view2 = UIView()
        view2.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 0.92, green: 0.96, blue: 0.98, alpha: 1)
        return view2
    }()
    
    //tableView
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 100
        //table.backgroundColor = .blue
        table.backgroundColor = UIColor(red: 0.92, green: 0.96, blue: 0.98, alpha: 1)
        return table
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        [viewTable, tableView] .forEach { view in
            addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            
            viewTable.topAnchor.constraint(equalTo: topAnchor),
            viewTable.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewTable.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewTable.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: viewTable.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: viewTable.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: viewTable.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: viewTable.bottomAnchor, constant: -20)
            
        ])
    }
}

