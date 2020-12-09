//
//  StoreServiceProtocol.swift
//  ProjectList
//
//  Created by Александр Тонхоноев on 08.12.2020.
//

import Foundation

protocol StoreServiceProtocol: AnyObject {
    
    func loadShoppingList(completion: @escaping ((Result<[ShoppingItemEntity], StoreServiceError>) -> ()))
    func add(shoppingItem: ShoppingItemEntity, completion: @escaping ((_ success: Bool)->()))
    func delete(shoppingItem: ShoppingItemEntity, completion: @escaping ((_ success: Bool)->()))
    func clear(completion: @escaping ((_ success: Bool)->()))
}

enum StoreServiceError: Error {
    case error(message: String, code: Int)
}
