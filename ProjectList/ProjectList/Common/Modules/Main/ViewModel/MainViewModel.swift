//
//  MainViewModel.swift
//  ProjectList
//
//  Created by Александр Тонхоноев on 08.12.2020.
//

import Foundation

class MainViewModel {
    
    let storeService: StoreServiceProtocol
    var shoppingListBindingClosure: ((ShoppingListState) -> ())?
    
    var shoppingList: ShoppingListState = .initial {
        didSet {
            self.shoppingListBindingClosure?(shoppingList)
        }
    }
    
    // MARK: Initializer
    required init(apiService: StoreServiceProtocol) {
        self.storeService = apiService
    }
}

extension MainViewModel: MainViewModelProtocol {

    func viewModelUpdate() {
        storeService.loadShoppingList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let resultArray):
                self.shoppingList = .success(shoppingList: resultArray.map({ entity -> ShoppingItemViewData in
                    ShoppingItemViewData(name: entity.name,
                                         comment: entity.comment,
                                         count: entity.count) {
                        //router.routeToAnotherModule(withModel: entity)
                        print("\(entity.name) selected")
                    }
                }))
            case .failure(.error(let errorMessage, _)):
                self.shoppingList = .error(errorMessage: errorMessage)
            }
        }
    }
    
}
