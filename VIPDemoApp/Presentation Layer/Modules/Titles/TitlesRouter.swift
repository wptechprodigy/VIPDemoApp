//
//  TitlesRouter.swift
//  VIPDemoApp
//
//  Created by waheedCodes on 10/11/2020.
//

import UIKit

protocol TitlesRouter: class {
    var navigationController: UINavigationController? { get }
    
    func routeToDetail(with titleId: String)
}

class TitlesRouterImplementation: TitlesRouter {
    weak var navigationController: UINavigationController?
    
    // MARK: - Route to Title details
    func routeToDetail(with titleId: String) {
        let viewController = TitleDetailsViewController()
        
        TitleDetailsConfigurator.configureModule(titleId: titleId,
                                                 viewController: viewController)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
