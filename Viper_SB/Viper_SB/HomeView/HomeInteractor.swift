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
    
    var arrayURL = [DetailURL]()    // to store the converted data got from our api call
    
    func interactorGetData() {          // ask remoteDataManager to get data
        remoteDatamanager?.remoteGetData()
    }
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    
    func remoteDataManagerCallBackData(with category: [CategoryURL]) { // interactor has raw data from remoteDataManager
        
        // interactor sends converted data to the presenter, from CategoryURL to DetailURL
        for url in category {
            let urlString = DetailURL(detailURL: url._links.mySelf[0].href)
            self.arrayURL.append(urlString)
        }
        // send converted data to presenter
        presenter?.interactorPushDataToPresenter(receivedData: self.arrayURL)
    }
}
