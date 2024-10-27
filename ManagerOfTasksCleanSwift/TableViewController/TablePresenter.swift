//
//  TablePresenter.swift
//  ManagerOfTasksCleanSwift
//
//  Created by Аркадий Варежкин on 21.10.2024.
//

import Foundation


protocol TablePresenterProtocol {
    func getTaskstoVC(response: TableModel.Response)
}

final class TablePresenter: TablePresenterProtocol {
    
    weak var viewController: TableViewControllerInputProtocol?
    
    func getTaskstoVC(response: TableModel.Response) {
        var tasks: [TaskViewModelProtocol] = []
        response.tasks.forEach { task in
            let taskViewModel = TableModel.ViewModel.TaskViewModel(task: task)
            tasks.append(taskViewModel)
        }

        let viewModel = TableModel.ViewModel(tasks: tasks)
        viewController?.setCountOfTasks(viewModel: viewModel)
    }
    
}
