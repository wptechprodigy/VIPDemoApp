//
//  TitleDetailsConfigurator.swift
//  VIPDemoApp
//
//  Created by waheedCodes on 12/11/2020.
//

import UIKit

class TitleDetailsConfigurator {
    
    static func configureModule(titleId: String,viewController: TitleDetailsViewController) {
        
        let view = TitleDetailsView()
        let interactor = TitleDetailsInteractorImplementation()
        let presenter = TitleDetailsPresenterImplementation()
        
        interactor.titleId = titleId
        
        viewController.TitleDetailsView = view
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
    }
    
}
