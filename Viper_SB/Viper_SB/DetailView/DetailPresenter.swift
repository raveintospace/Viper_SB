//
//  DetailPresenter.swift
//  Viper_SB
//
//  Created by Uri on 28/11/22.
//  
//

import Foundation

class DetailPresenter: DetailPresenterProtocol  {
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    var dataURLReceived: DetailURL? // stores the data sent from our mainVC
    
    func viewDidLoad() {
        print("I'm the detail VC and I have: \(String(describing: dataURLReceived?.detailURL))")
        
        if let dataURLReceived = dataURLReceived {
            view?.showDataInLabel(data: dataURLReceived)
        }
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
