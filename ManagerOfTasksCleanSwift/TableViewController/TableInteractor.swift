//
//  TableInteractor.swift
//  ManagerOfTasksCleanSwift
//
//  Created by Аркадий Варежкин on 21.10.2024.
//

import Foundation

protocol TableInteractorInputProtocol {
    func getTasks()
}


final class TableInteractor: TableInteractorInputProtocol {
    
    private let userDefaults: UserDefaults = UserDefaults.standard
    
    var presenter: TablePresenterProtocol?
    
   
    func getTasks() {
//        guard let tasks = userDefaults.getCodableObject(dataType: [Task].self, key: "tasks") else {
//            return
//        }
        
        let tasks: [Task] = [Task(title: "Первая задача", text: "123213123"), Task(title: "Вторая задача", text: "123213123"), Task(title: "Третья задача", text: "123213123")]
        
        let response = TableModel.Response(tasks: tasks)
        presenter?.getTaskstoVC(response: response)
    }
    
    
}
