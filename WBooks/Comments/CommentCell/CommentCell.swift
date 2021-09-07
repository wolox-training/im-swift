//
//  CommentCell2.swift
//  WBooks
//
//  Created by ignacio.mendez on 31/08/2021.
//

import UIKit

class CommentCell: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelComment: UILabel!
    @IBOutlet weak var imageUser: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(with viewModel: CommentCellViewModel) {
        labelName.text = String(viewModel.userId)
        labelComment.text = viewModel.content
        imageUser.setRounded()
    }
}
