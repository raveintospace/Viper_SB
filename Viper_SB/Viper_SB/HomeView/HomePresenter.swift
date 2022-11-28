//
//  HomePresenter.swift
//  Viper_SB
//  Central Hub
//  Created by Uri on 24/11/22.
//  
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties to call our elements
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    func viewDidLoad() {
        // ask the interactor to import data using its own func
        interactor?.interactorGetData()
        view?.startActivitySpinner()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // receive data from interactor and send it to view
    func interactorPushDataToPresenter(receivedData: [DetailURL]) {
        view?.presenterPushToDataView(receivedData: receivedData)
        view?.stopAndHideActivitySpinner()
    }
    
}
