//
//  ShoppingItemCell.swift
//  ProjectList
//
//  Created by Александр Тонхоноев on 08.12.2020.
//

import UIKit

class ShoppingItemCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var count: UILabel!
    
    
    func configure(with item: ShoppingItemViewData) {
        title.text = item.name
        comment.text = item.comment
        count.text = "\(item.count)"
    }

}
