//
//  MyCustomCell.swift
//  WBooks
//
//  Created by Nacho Mendez on 02/08/2021.
//

import UIKit

class MyCustomCell: UITableViewCell {
    
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
