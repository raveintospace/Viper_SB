//
//  HomeRemoteDataManager.swift
//  Viper_SB
//  Connection layer
//  Created by Uri on 24/11/22.
//  
//

import Foundation

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    
    var getUrl = [CategoryURL]()  // to store the data we got after calling our remote server
    
    func remoteGetData() {      // call to our remote server to get data for our interactor
        
        let session = URLSession.shared
        
        var request = URLRequest(url: URL(string: "https://cfeapps.com/wp-json/wp/v2/categories")!)
        
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/x-www-form-urlencoded; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")
        
        session.dataTask(with: request) {(data, response, error) in
            guard let data = data, error == nil, let response = response as? HTTPURLResponse else {
                print("Connection error: \(error!)")
                return
            }
            if response.statusCode == 200{
                print("Getting from server: \(data)")
                
                do {
                    let decoder = JSONDecoder()
                    
                    self.getUrl = try decoder.decode([CategoryURL].self, from: data)
                    
                    // send data to interactor
                    self.remoteRequestHandler?.remoteDataManagerCallBackData(with: self.getUrl)
                    
                } catch {
                    print("Parsing error, error: \(error.localizedDescription)")
                }
                
            } else {
                print("An error happened: \(response.statusCode)")
            }
        }.resume()
    }
}
