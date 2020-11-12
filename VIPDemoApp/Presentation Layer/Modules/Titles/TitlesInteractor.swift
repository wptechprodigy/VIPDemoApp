//
//  TitlesInteractor.swift
//  VIPDemoApp
//
//  Created by waheedCodes on 10/11/2020.
//

import UIKit

protocol TitlesInteractor: class {
    func viewDidLoad()
    
    func addTapped(with text: String)
    
    func didCommitDelete(for index: Int)
    
    func didSelectRow(at index: Int)
}

class TitlesInteractorImplementation: TitlesInteractor {
    
    // MARK: - Properties
    var presenter: TitlesPresenter?
    
    private let titlesService = TitlesServiceImplementation()
    private var titles: [Title] = []
    
    func viewDidLoad()  {
        do {
            self.titles = try titlesService.getTitles()
            
            presenter?.interactor(didRetrieveTitles: self.titles)
        } catch {
            presenter?.interactor(didFailRetrieveTitles: error)
        }
    }
    
    func addTapped(with text: String) {
        do {
            let title = try titlesService.addTitle(text: text)
            self.titles.append(title)
            
            presenter?.interactor(didAddTitle: title)
        } catch {
            presenter?.interactor(didFailAddTitle: error)
        }
    }
    
    func didCommitDelete(for index: Int) {
        do {
            try titlesService.deleteTitle(with: self.titles[index].id!)
            self.titles.remove(at: index)
            presenter?.interactor(didDeleteTitleAtIndex: index)
        } catch {
            presenter?.interactor(didFailDeleteTitleAtIndex: index)
        }
    }
    
    func didSelectRow(at index: Int) {
        if self.titles.indices.contains(index) {
            presenter?.interactor(didFindTitle: self.titles[index])
        }
    }
    
}
