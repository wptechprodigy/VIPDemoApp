//
//  TitlesPresenter.swift
//  VIPDemoApp
//
//  Created by waheedCodes on 12/11/2020.
//

import UIKit

protocol TitlesPresenter: class {
    func interactor(didRetrieveTitles titles: [Title])
    func interactor(didFailRetrieveTitles error: Error)
    
    func interactor(didAddTitle title: Title)
    func interactor(didFailAddTitle error: Error)
    
    func interactor(didDeleteTitleAtIndex index: Int)
    func interactor(didFailDeleteTitleAtIndex index: Int)
    
    func interactor(didFindTitle title: Title)
    func interactor(didFailFindTitle error: Error)
}

class TitlePresenterImplementation: TitlesPresenter {
    weak var viewController: TitlesPresenterOutput?
    
    func interactor(didRetrieveTitles titles: [Title]) {
        let titlesStrings = titles.compactMap { $0.text }
        viewController?.presenter(didRetrieveItems: titlesStrings)
    }
    
    func interactor(didFailRetrieveTitles error: Error) {
        viewController?.presenter(didFailRetrieveItems: error.localizedDescription)
    }
    
    func interactor(didAddTitle title: Title) {
        if let titlesString = title.text {
            viewController?.presenter(didAddItem: titlesString)
        }
    }
    
    func interactor(didFailAddTitle error: Error) {
        viewController?.presenter(didFailAddItem: error.localizedDescription)
    }
    
    func interactor(didDeleteTitleAtIndex index: Int) {
        viewController?.presenter(didDeleteItemAtIndex: index)
    }
    
    func interactor(didFailDeleteTitleAtIndex index: Int) {
        viewController?.presenter(didFailDeleteItemAtIndex: index, message: "Couldn't delete")
    }
    
    func interactor(didFindTitle title: Title) {
        if let titleId = title.id {
            viewController?.presenter(didObtainItemId: titleId)
        }
    }
    
    func interactor(didFailFindTitle error: Error) {
        viewController?.presenter(didFailObtainItemId: error.localizedDescription)
    }
}
