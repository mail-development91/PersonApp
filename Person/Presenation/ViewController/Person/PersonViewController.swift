//
//  PersonViewController.swift
//  DemoApp
//
//  Created by Amit Kumar on 03/01/24.
//

import UIKit

/// PersonViewController Class
final class PersonViewController: UIViewController {
    
    /// ViewModel Object
    var viewModel: PersonViewModelProtocol?
    
    /// Cell Reusable Identifire
    private let cellId = String(describing: PersonTableViewCell.self)
    
    /// Table view object
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero,
                                style: .plain)
        table.delegate = self
        table.dataSource = self
        table.register(PersonTableViewCell.self,
                       forCellReuseIdentifier: self.cellId)
        return table
    }()
    
    /// ViewDidLoad mothod of  PersonViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.loadData()
        setTitle()
        setAppearance()
    }
    
    /// /// viewWillAppear mothod of  PersonViewController
    /// - Parameter animated: true OR false param
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.addSubview(tableView)
        tableView.frame = CGRectMake(0 ,
                                     0,
                                     self.view.frame.width,
                                     self.view.frame.height)
    }
    
    /// to set the title of tha screen
    private func setTitle() {
        self.title = AppConstant.title
    }
    
    /// to set the appearnce of navigation bar
    private func setAppearance() {
        self.navigationController?.setAppearance()
    }
}

extension PersonViewController: PersonOutputProtocol, AlertProtocol {
    
    /// show the data once it fetched from network
    func showResult() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    /// Show Error if it occured
    /// - Parameter error: error message
    func showError(_ error: String) {
        showAlert(message: error, on: self)
    }
    
    /// show detail if user click on any row of the list
    /// - Parameter index: index of the row
    private func showDetail(index: Int) {
        guard let person = viewModel?.personList[index] as? Person else {
            return
        }
        self.viewModel?.router?.loadPersonDetail(person: person)
    }
}
    
extension PersonViewController: UITableViewDataSource {
    
    /// TableView  DataSource method
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId) as? PersonTableViewCell else {
            fatalError("Cell not found")
        }
        cell.configureCell(person: viewModel?.personList[indexPath.row])
        return cell
    }
    
    /// TableView  DataSource method
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.personList.count ?? ConstantValue.cellCount
    }
}

extension PersonViewController: UITableViewDelegate {
    
    /// TableView  Delegate method
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ConstantValue.cellheight
    }
    
    /// TableView  Delegate method
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.showDetail(index: indexPath.row)
    }
}
