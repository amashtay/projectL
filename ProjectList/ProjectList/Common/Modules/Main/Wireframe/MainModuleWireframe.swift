//
//  MainModuleWireframe.swift
//  ProjectList
//
//  Created by Александр Тонхоноев on 08.12.2020.
//

import UIKit

class MainModuleWireframe {
    
    static func createModule() -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateInitialViewController()
        
        if let controller = controller as? MainViewController {
            let viewModel = MainViewModel(storeService: MockStoreService())
            controller.viewModel = viewModel
        }
        return controller
    }
    
}
