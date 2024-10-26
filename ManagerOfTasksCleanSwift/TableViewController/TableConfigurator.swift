//
//  TableConfigurator.swift
//  ManagerOfTasksCleanSwift
//
//  Created by Аркадий Варежкин on 22.10.2024.
//

import Foundation
import UIKit


protocol TableConfiguratorProtocol {
    func configure(with viewController: TableViewController)
}


final class TableConfigurator: TableConfiguratorProtocol {
    
    static let shared: TableConfiguratorProtocol = TableConfigurator()
    
    private init() {}
    
    func configure(with viewController: TableViewController) {
        let interactor = TableInteractor()
        let presenter = TablePresenter()
        let router = TableRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
    
}
