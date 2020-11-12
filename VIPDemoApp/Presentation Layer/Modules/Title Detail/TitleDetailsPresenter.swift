//
//  TitleDetailsPresenter.swift
//  VIPDemoApp
//
//  Created by waheedCodes on 12/11/2020.
//

import Foundation

protocol TitleDetailsPresenter: class {
    func interactor(didRetrieveTitle title: Title)
    func interactor(didFailRetrieveTitle error: Error)
}

class TitleDetailsPresenterImplementation: TitleDetailsPresenter {
    var viewController: TitleDetailsPresenterOutput?
    
    func interactor(didRetrieveTitle title: Title) {
        let titleString = title.text
        viewController?.presenter(didRetrieveItem: titleString ?? "")
    }
    
    func interactor(didFailRetrieveTitle error: Error) {
        viewController?.presenter(didFailRetrieveItem: error.localizedDescription)
    }
}
