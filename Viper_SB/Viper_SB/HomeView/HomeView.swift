//
//  HomeView.swift
//  Viper_SB
//  View -> It's dumb, can't do any logic operation!
//  Created by Uri on 24/11/22.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController {

// MARK: - Properties to communicate with the presenter
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    var presenter: HomePresenterProtocol?

    var arrayViewURL = [DetailURL]()    // stores data received from presenter
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // communicate the view with the presenter
        presenter?.viewDidLoad()
    }
}

extension HomeView: HomeViewProtocol {
    
    // show in view data received from Presenter
    func presenterPushToDataView(receivedData: [DetailURL]) {
        arrayViewURL = receivedData
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func startActivitySpinner() {   // func is defined here, but called in Presenter
        DispatchQueue.main.async {
            self.activity.startAnimating()
        }
    }
    
    func stopAndHideActivitySpinner() {
        DispatchQueue.main.async {
            self.activity.stopAnimating()
            self.activity.hidesWhenStopped = true
        }
    }
}

extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayViewURL.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = arrayViewURL[indexPath.row].detailURL
        return cell
    }
}

extension HomeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetailView(with: DetailURL(detailURL: arrayViewURL[indexPath.row].detailURL))
    }
    
}
