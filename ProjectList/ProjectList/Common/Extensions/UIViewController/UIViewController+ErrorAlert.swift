//
//  UIViewController+ErrorAlert.swift
//  ProjectList
//
//  Created by Александр Тонхоноев on 08.12.2020.
//

import UIKit

extension UIViewController {
    
    func showErrorInAlert(errorMessage: String) {
        let alertVC = UIAlertController(title: "Ошибка", message: errorMessage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Печаль", style: .cancel)
        alertVC.addAction(alertAction)
        present(alertVC, animated: true, completion: nil)
    }
    
}
