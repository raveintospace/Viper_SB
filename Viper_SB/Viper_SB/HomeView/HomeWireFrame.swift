//
//  HomeWireFrame.swift
//  Viper_SB
//  Router class
//  Created by Uri on 24/11/22.
//  https://www.youtube.com/watch?v=9dOsSb_TXq8 - how to set homeView as launching screen
//

import Foundation
import UIKit

class HomeWireFrame: HomeWireFrameProtocol {
    
    // initializes our HomeView Viper Module (all the swift files inside the HomeView folder)
    class func createHomeModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "navigation")
        if let view = navController.children.first as? HomeView {       // initializations
            let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
            let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor()
            let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
            let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
            let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
            
            // instantiations
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "HomeView", bundle: Bundle.main)
    }
    
    func presentNewViewDetail(from view: UIViewController, withData: DetailURL) {
        let newDetailView = DetailWireFrame.createDetailModule(with: withData)    // creates and instantiates a new Viper module
        view.navigationController?.pushViewController(newDetailView, animated: true)
    }    
}
