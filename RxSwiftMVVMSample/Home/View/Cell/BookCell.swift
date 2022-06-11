//
//  BookCell.swift
//  RxSwiftMVVMSample
//
//  Created by The Ngoc on 2022/06/11.
//

import UIKit

class BookCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindData(_ book: Book) {
        titleLabel.text = book.title
        contentLabel.text = book.author
    }
}
