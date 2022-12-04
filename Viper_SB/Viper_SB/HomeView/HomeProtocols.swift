//
//  HomeProtocols.swift
//  Viper_SB
//  To communicate the Viper elements amongst them
//  Created by Uri on 24/11/22.
//  
//

import Foundation
import UIKit

protocol HomeViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: HomePresenterProtocol? { get set }
    func presenterPushToDataView(receivedData: [DetailURL])  // to send data from presenter to view
    func startActivitySpinner()
    func stopAndHideActivitySpinner()
}

protocol HomeWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME aka Router
    static func createHomeModule() -> UIViewController

    func presentNewViewDetail(from view: HomeViewProtocol, withData: DetailURL) // to present a new VC from our HVC
}

protocol HomePresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    
    func viewDidLoad()
    
    func showDetailView(with data: DetailURL)
}

protocol HomeInteractorOutputProtocol: class {  // to send data from interactor to presenter
    // INTERACTOR -> PRESENTER
    func interactorPushDataToPresenter(receivedData: [DetailURL])
}

protocol HomeInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }
    var localDatamanager: HomeLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol? { get set }
    
    // interactor manages data when called from the presenter
    func interactorGetData()
}

protocol HomeDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol HomeRemoteDataManagerInputProtocol: class {    // Interactor asks data to remoteDataManager
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol? { get set }
    func remoteGetData()    // to get data from our api
}

protocol HomeRemoteDataManagerOutputProtocol: class {   // remoteDataManager sends data to Interactor
    // REMOTEDATAMANAGER -> INTERACTOR
    func remoteDataManagerCallBackData(with category: [CategoryURL])
}

protocol HomeLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
