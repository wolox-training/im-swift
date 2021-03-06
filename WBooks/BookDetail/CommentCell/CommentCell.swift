//
//  CommentCell.swift
//  WBooks
//
//  Created by ignacio.mendez on 12/08/2021.
//

import UIKit

class CommentCell: UITableViewCell {
    
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelComment: UILabel!
    @IBOutlet weak var imageUser: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(with viewModel: CommentCellViewModel) {
        labelName.text = String(viewModel.user_id)
        labelComment.text = viewModel.content
        imageUser.setRounded()
    }
    
    /*
     func configureCell(with viewModel: LibraryCellViewModel) {
         lblFirst.text = viewModel.title
         lblSecond.text = viewModel.author
         imageTask = imageBook.downloaded(from: viewModel.image)
     }
     */

}
