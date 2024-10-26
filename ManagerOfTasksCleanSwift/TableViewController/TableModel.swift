//
//  TableModel.swift
//  ManagerOfTasksCleanSwift
//
//  Created by Аркадий Варежкин on 21.10.2024.
//

import Foundation

protocol TaskViewModelProtocol {}


enum TableModel {
    
//    struct Request {
//        
//    }
    
    struct Response {
        let tasks: [Task]
    }
    
    struct ViewModel {
        
        let tasks: [TaskViewModelProtocol]
        
        struct TaskViewModel: TaskViewModelProtocol {
            let title: String
            let text: String
            
            init(task: Task) {
                self.title = task.title
                self.text = task.text
            }
        }
    }

}

