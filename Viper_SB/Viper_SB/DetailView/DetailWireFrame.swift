//
//  DetailWireFrame.swift
//  Viper_SB
//  https://youtu.be/BzKTVGbDN8g how to configure a new detail module
//  Created by Uri on 28/11/22.
//  
//

import Foundation
import UIKit

class DetailWireFrame: DetailWireFrameProtocol {

    static func createDetailModule(with data: DetailURL) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "detailView")
        if let view = viewController as? DetailView {
            let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
            let interactor: DetailInteractorInputProtocol & DetailRemoteDataManagerOutputProtocol = DetailInteractor()
            let localDataManager: DetailLocalDataManagerInputProtocol = DetailLocalDataManager()
            let remoteDataManager: DetailRemoteDataManagerInputProtocol = DetailRemoteDataManager()
            let wireFrame: DetailWireFrameProtocol = DetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            presenter.dataURLReceived = data    // assign the data coming from mainVC to the property of presenter
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "DetailView", bundle: Bundle.main)
    }
    
}
