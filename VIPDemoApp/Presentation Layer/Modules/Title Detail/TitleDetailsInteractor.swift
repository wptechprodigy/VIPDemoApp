//
//  TitleDetailsInteractor.swift
//  VIPDemoApp
//
//  Created by waheedCodes on 12/11/2020.
//

import Foundation

protocol TitleDetailsInteractor: class {
    var titleId: String? { get }
    
    func viewDidLoad()
}

class TitleDetailsInteractorImplementation: TitleDetailsInteractor {
    var titleId: String?
    
    var presenter: TitleDetailsPresenter?
    
    private let titlesService = TitlesServiceImplementation()
    
    func viewDidLoad() {
        do {
            if let title = try titlesService.getTitle(with: self.titleId!) {
                presenter?.interactor(didRetrieveTitle: title)
            }
        } catch {
            presenter?.interactor(didFailRetrieveTitle: error)
        }
    }
}
