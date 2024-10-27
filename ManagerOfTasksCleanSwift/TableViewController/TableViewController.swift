//
//  ViewController.swift
//  ManagerOfTasksCleanSwift
//
//  Created by Аркадий Варежкин on 21.10.2024.
//

import UIKit



final class TableViewController: UIViewController {
    
    var interactor: TableInteractorInputProtocol?
    var router: TableRouterInputProtocol?
    
    private let configurator: TableConfiguratorProtocol
    
    private var tasks: [TaskViewModelProtocol] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init(configurator: TableConfiguratorProtocol = TableConfigurator.shared) {
        self.configurator = configurator
        super.init(nibName: nil, bundle: nil)
        configurator.configure(with: self)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setTableView()
        getTasks()
    }
    
    
    private func setTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func getTasks() {
        interactor?.getTasks()
    }
}


// MARK: - UITableViewDataSource

extension TableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.cellModel = tasks[indexPath.row]
        
        return cell
    }
    
    
}
 
// MARK: - UITableViewDelegate

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}

// MARK: - Input

// Методы, вызываемые презентером
protocol TableViewControllerInputProtocol: AnyObject {
    func setCountOfTasks(viewModel: TableModel.ViewModel)
}



extension TableViewController: TableViewControllerInputProtocol {
    func setCountOfTasks(viewModel: TableModel.ViewModel) {
        tasks = viewModel.tasks
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
