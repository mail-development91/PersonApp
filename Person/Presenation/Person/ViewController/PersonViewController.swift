//
//  PersonViewController.swift
//  DemoApp
//
//  Created by Amit Kumar on 03/01/24.
//

import UIKit

final class PersonViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView?
    var viewModel: PersonViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.dataSource = self
        tableView?.delegate = self
        viewModel?.loadData()
    }
}

extension PersonViewController: PersonOutputProtocol, AlertProtocol {
    
    func showResult() {
        tableView?.reloadData()
    }
    
    func showError(_ error: String) {
        showAlert(message: error, on: self)
    }
    
    private func showDetail(index: Int) {
        guard let person = viewModel?.personList[index] as? Person else {
            return
        }
        self.viewModel?.router?.loadPersonDetail(person: person)
    }
}
    
extension PersonViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell") as? PersonTableViewCell else {
            fatalError("Cell not found")
        }
        cell.configureCell(person: viewModel?.personList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.personList.count ?? 0
    }
}

extension PersonViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        self.showDetail(index: indexPath.row)
    }
}
