//
//  MainViewData.swift
//  ProjectList
//
//  Created by Александр Тонхоноев on 08.12.2020.
//

import Foundation

enum ShoppingListState {
    case initial
    case loading(loadingMessage: String?)
    case success(shoppingList: [ShoppingItemViewData])
    case error(errorMessage: String)
}

struct ShoppingItemViewData {
    var name: String?
    var comment: String?
    var count: Int = 1
    
    var actionBlock: (() -> ())?
}
