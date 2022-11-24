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

    // MARK: Properties to communicate with the presenter
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
