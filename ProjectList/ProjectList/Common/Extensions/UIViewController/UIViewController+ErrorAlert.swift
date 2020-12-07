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
        present(alertVC, animated: true, completion: nil)
    }
    
}
