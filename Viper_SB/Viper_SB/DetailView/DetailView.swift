//
//  DetailView.swift
//  Viper_SB
//
//  Created by Uri on 28/11/22.
//  
//

import Foundation
import UIKit

class DetailView: UIViewController {

    // MARK: Properties
    var presenter: DetailPresenterProtocol?

    @IBOutlet weak var detailViewLabel: UILabel!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DetailView: DetailViewProtocol {
    // TODO: implement view output methods
}

// https://youtu.be/dPZFWr0U-uI lesson 40 for tuesday
