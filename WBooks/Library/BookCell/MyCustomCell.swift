//
//  MyCustomCell.swift
//  WBooks
//
//  Created by Nacho Mendez on 04/08/2021.
//

import UIKit

class MyCustomCell: UITableViewCell {
    
    @IBOutlet weak var lblFirst: UILabel!
    @IBOutlet weak var lblSecond: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(with viewModel: MyCustomCellViewModel) {
        lblFirst.text = viewModel.title
        lblSecond.text = viewModel.author
    }
}
