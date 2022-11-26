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

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // communicate the view with the presenter
        presenter?.viewDidLoad()
    }
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
}

extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "Hello"
        return cell
    }
}

extension HomeView: UITableViewDelegate {
    
}
