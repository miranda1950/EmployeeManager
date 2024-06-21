//
//  EmployeesViewController.swift
//  EmployeeManager
//
//  Created by Miran on 08.06.2024..
//

import UIKit


final class EmployeesViewController: UIViewController {
    
    var viewModel: EmployeesViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
     
        viewModel.loadData()
        setupConstraints()
        setupCallbacks()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        

        viewModel.loadData()
        
    }
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Employees"
        titleLabel.numberOfLines = 2
        titleLabel.style(color: .darkRed ,alignment: .left)
        view.addSubview(titleLabel)
        return titleLabel
    }()
    
    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.barTintColor = .black
        search.delegate = self
        let textFieldInsideSearchBar = search.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = UIColor.lightGray
        textFieldInsideSearchBar?.leftView?.tintColor = .darkRed
        view.addSubview(search)
        return search
    }()
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: "employeeTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundView = nil
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        view.addSubview(tableView)
        return tableView
    }()
}


extension EmployeesViewController {
    
    private func setupCallbacks() {
        viewModel.onGotData = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private func setupConstraints() {
        
        
        searchBar.anchor(top: (view.safeAreaLayoutGuide.topAnchor, 20), leading: (view.leadingAnchor, 20), trailing: (view.trailingAnchor, 20), size: CGSize(width: 0, height: 52))
        
        titleLabel.anchor(top: (searchBar.safeAreaLayoutGuide.bottomAnchor, 12), leading: (view.leadingAnchor, 20), trailing: (view.trailingAnchor, 20))
        
        
        tableView.anchor(top: (titleLabel.bottomAnchor, 12),bottom: (view.safeAreaLayoutGuide.bottomAnchor, 20) ,leading: (view.safeAreaLayoutGuide.leadingAnchor, 20), trailing: (view.safeAreaLayoutGuide.trailingAnchor, 20))
    }
}


extension EmployeesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "employeeTableViewCell", for: indexPath) as? EmployeeTableViewCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        guard indexPath.row < viewModel.employees.count else {
                return cell
            }
            let employee = viewModel.employees[indexPath.row]
            cell.employee = employee
            return cell
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let employee = self.viewModel.employees[indexPath.row]
          let deleteItem = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
              
              
              
              self.viewModel.deleteFromDatabase(employee)
              self.viewModel.employees.remove(at: indexPath.row)
              tableView.deleteRows(at: [indexPath], with: .automatic)
              self.tableView.reloadData()
          }
            
          let swipeActions = UISwipeActionsConfiguration(actions: [deleteItem])

          return swipeActions
      }
    
}

extension EmployeesViewController: UISearchBarDelegate {
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard let query = searchBar.text else {
            
            return
        }
        
        viewModel.queryText = query.lowercased()
       
       
    }
    
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
    }
    
    @objc private func closeKeyboardIfNeeded(_ sender: UITapGestureRecognizer) {
        guard searchBar.isFirstResponder else {
            return
        }
        searchBar.resignFirstResponder()
        sender.cancelsTouchesInView = false
        
    }
    
}
