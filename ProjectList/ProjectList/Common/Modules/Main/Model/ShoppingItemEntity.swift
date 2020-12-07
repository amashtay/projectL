//
//  ShoppingItem.swift
//  ProjectList
//
//  Created by Александр Тонхоноев on 08.12.2020.
//

import Foundation

struct ShoppingItemEntity {

    let name: String
    var comment: String?
    var count: Int
    
    let uuid: UUID = UUID()
}
