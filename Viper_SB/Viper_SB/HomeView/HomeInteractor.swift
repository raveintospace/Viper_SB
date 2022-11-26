//
//  HomeInteractor.swift
//  Viper_SB
//  Logic
//  Created by Uri on 24/11/22.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?

    func interactorGetData() {          // ask remoteDataManager to get data
        remoteDatamanager?.remoteGetData()
    }
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
