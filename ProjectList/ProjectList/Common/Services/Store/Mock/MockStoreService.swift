//
//  MockStoreService.swift
//  ProjectList
//
//  Created by Александр Тонхоноев on 08.12.2020.
//

import Foundation

class MockStoreService: StoreServiceProtocol {

    private var result: [ShoppingItemEntity] = [
        ShoppingItemEntity(name: "Сыр Дор Блю", comment: "400грамм", count: 1),
        ShoppingItemEntity(name: "Красная икра", comment: "желательно из Тель-Авива", count: 2),
        ShoppingItemEntity(name: "Форель", comment: "свежая!", count: 5),
        ShoppingItemEntity(name: "Доширак", comment: nil, count: 100)
    ]
        
    func loadShoppingList(completion: @escaping ((Result<[ShoppingItemEntity], StoreServiceError>) -> ())) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            guard let self = self else { return }
            //completion(.failure(StoreServiceError.error(message: "Что-то пошло не так", code: 404)))
            completion(.success(self.result))
        }
    }

    func add(shoppingItem: ShoppingItemEntity, completion: @escaping ((_ success: Bool) -> ())) {
        result.append(shoppingItem)
        completion(true)
    }
    
    func delete(shoppingItem: ShoppingItemEntity, completion: @escaping ((_ success: Bool) -> ())) {
        result = result.compactMap({
            ($0.uuid == shoppingItem.uuid) ? nil : $0
        })
        completion(true)
    }
    
    func clear(completion: @escaping ((_ success: Bool) -> ())) { completion(false) }
    
}
