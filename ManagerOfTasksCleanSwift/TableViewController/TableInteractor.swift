//
//  TableInteractor.swift
//  ManagerOfTasksCleanSwift
//
//  Created by Аркадий Варежкин on 21.10.2024.
//

import Foundation

protocol TableInteractorInputProtocol {
    func getCountOfTasks()
}


final class TableInteractor: TableInteractorInputProtocol {
    
    private let userDefaults: UserDefaults = UserDefaults.standard
    
    var presenter: TablePresenterProtocol?
    
   
    func getCountOfTasks() {
        guard let tasks = userDefaults.getCodableObject(dataType: [Task].self, key: "tasks") else {
            return
        }
        
        let response = TableModel.Response(tasks: tasks)
        presenter?.getCountOfTasks(response: response)
    }
    
}
