//
//  MockStoreService.swift
//  ProjectList
//
//  Created by Александр Тонхоноев on 08.12.2020.
//

import Foundation

class MockStoreService: StoreServiceProtocol {
        
    func loadShoppingList(completion: @escaping ((Result<[ShoppingItemEntity], StoreServiceError>) -> ())) {
        
        let result: [ShoppingItemEntity] = [
            ShoppingItemEntity(name: "Сыр Дор Блю", comment: "400грамм", count: 1),
            ShoppingItemEntity(name: "Красная икра", comment: "желательно из Тель-Авива", count: 2),
            ShoppingItemEntity(name: "Форель", comment: "свежая!", count: 5),
            ShoppingItemEntity(name: "Доширак", comment: nil, count: 100)
        ]
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            //completion(.failure(StoreServiceError.error(message: "Что-то пошло не так", code: 404)))
            completion(.success(result))
        }
    }

    func add(shoppingItem: ShoppingItemEntity) {
        
    }
    
    func delete(shoppingItem: ShoppingItemEntity) {
        
    }
    
    func clear() {
        
    }
    
}
