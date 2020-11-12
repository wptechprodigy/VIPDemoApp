//
//  TitleDetailViewController.swift
//  VIPDemoApp
//
//  Created by waheedCodes on 12/11/2020.
//

import UIKit

protocol TitleDetailsPresenterOutput: class {
    func presenter(didRetrieveItem item: String)
    func presenter(didFailRetrieveItem message: String)
}

class TitleDetailsViewController: UIViewController {
    
    // MARK: - Properties
    var titleDetailsView: TitleDetailsView?
    var interactor: TitleDetailsInteractor?
    weak var presenter: TitleDetailsPresenter?

    // MARK: - Lifecycle Methods
    override func loadView() {
        super.loadView()
        self.view = titleDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactor?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension TitleDetailsViewController: TitleDetailsPresenterOutput {
    func presenter(didRetrieveItem item: String) {
        titleDetailsView?.updateLabel(with: item)
    }
    
    func presenter(didFailRetrieveItem message: String) {
        showError(with: message)
    }
}
