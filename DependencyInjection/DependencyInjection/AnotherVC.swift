//
//  AnotherVC.swift
//  DependencyInjection
//
//  Created by Yakup on 31.08.2023.
//

import UIKit

class AnotherVC: UIViewController {

    private let providerProtocol : BackgroundProviderProtocol?
    
    init(providerProtocol: BackgroundProviderProtocol?) {
        self.providerProtocol = providerProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = providerProtocol?.backgroundColor ?? .black
    }

}
