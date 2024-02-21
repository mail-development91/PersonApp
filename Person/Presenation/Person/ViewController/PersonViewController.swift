//
//  PersonViewController.swift
//  DemoApp
//
//  Created by Amit Kumar on 03/01/24.
//

import UIKit

final class PersonViewController: BaseViewController {
    var viewModel: PersonViewModelProtocol?
    private let cellId = "PersonTableViewCell"
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.register(PersonTableViewCell.self, forCellReuseIdentifier: self.cellId)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.loadData()
        self.title = Constant.title
        self.navigationController?.setAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.addSubview(tableView)
        tableView.frame = CGRectMake(0 , 0, self.view.frame.width, self.view.frame.height)
    }
}

extension PersonViewController: PersonOutputProtocol, AlertProtocol {
    
    func showResult() {
        tableView.reloadData()
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId) as? PersonTableViewCell else {
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
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.showDetail(index: indexPath.row)
    }
}
