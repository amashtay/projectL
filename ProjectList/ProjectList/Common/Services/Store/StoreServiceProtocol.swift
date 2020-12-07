//
//  StoreServiceProtocol.swift
//  ProjectList
//
//  Created by Александр Тонхоноев on 08.12.2020.
//

import Foundation

protocol StoreServiceProtocol: AnyObject {
    
    func loadShoppingList(completion: @escaping ((Result<[ShoppingItemEntity], StoreServiceError>) -> ()))
    func add(shoppingItem: ShoppingItemEntity)
    func delete(shoppingItem: ShoppingItemEntity)
    func clear()
}

enum StoreServiceError: Error {
    case error(message: String, code: Int)
}
