//
//  MainViewModelProtocol.swift
//  ProjectList
//
//  Created by Александр Тонхоноев on 08.12.2020.
//

import Foundation

protocol MainViewModelProtocol: AnyObject {
        
    var shoppingListBindingClosure: ((ShoppingListState) -> ())? { get set}
    func viewModelUpdate()
    
}
