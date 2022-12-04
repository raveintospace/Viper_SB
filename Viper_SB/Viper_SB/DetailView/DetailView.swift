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
        presenter?.viewDidLoad()
    }
}

extension DetailView: DetailViewProtocol {
    // TODO: implement view output methods
    func showDataInLabel(data: DetailURL) {
        detailViewLabel.text = data.detailURL
    }
}
