//
//  MainViewController.swift
//  ProjectList
//
//  Created by Александр Тонхоноев on 07.12.2020.
//

import UIKit

class MainViewController: UIViewController {
    
    var viewModel: MainViewModelProtocol! {
        didSet {
            viewModel.shoppingListBindingClosure = { [weak self] shoppingListState in
                self?.configureViewData(with: shoppingListState)
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewData = [ShoppingItemViewData]()
    private let shoppingItemCellReuseName = "ShoppingItemCell"
        
    // MARK: View's lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialTableViewConfiguration()
        viewModel.viewModelUpdate()
    }
    
    // MARK: Private
    
    private func initialTableViewConfiguration() {
        tableView.register(UINib(nibName: shoppingItemCellReuseName, bundle: nil), forCellReuseIdentifier: shoppingItemCellReuseName)
    }
    
    private func configureViewData(with shoppingListState: ShoppingListState) {
        switch shoppingListState {
        case .success(shoppingList: let shoppingList):
            viewData = shoppingList
            tableView.reloadData()
        case .loading(loadingMessage: _):
            break
        case .error(errorMessage: let errorMessage):
            showErrorInAlert(errorMessage: errorMessage)
        default:
            break
        }
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: shoppingItemCellReuseName, for: indexPath) as? ShoppingItemCell {
            cell.configure(with: viewData[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewData[indexPath.row].actionBlock?()
    }
    
}
