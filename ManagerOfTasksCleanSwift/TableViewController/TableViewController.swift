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
    
    init(configurator: TableConfiguratorProtocol = TableConfigurator.shared) {
        self.configurator = configurator
        super.init(nibName: nil, bundle: nil)
        configurator.configure(with: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}



extension TableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    
}


extension TableViewController: UITableViewDelegate {
    
}


// Методы, вызываемые презентером
protocol TableViewControllerInputProtocol: AnyObject {
    func setCountOfTasks(viewModel: TableModel.ViewModel)
}



extension TableViewController: TableViewControllerInputProtocol {
    func setCountOfTasks(viewModel: TableModel.ViewModel) {
        tasks = viewModel.tasks
    }
}
