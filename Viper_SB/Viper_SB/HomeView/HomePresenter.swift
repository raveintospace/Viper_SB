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
        print("View has called me!")
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
