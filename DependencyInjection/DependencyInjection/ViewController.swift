//
//  ViewController.swift
//  DependencyInjection
//
//  Created by Yakup on 31.08.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBrown
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        button.setTitle("Open Another View Controller", for: .normal)
        button.center = view.center
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func buttonClicked()
    {
        if let viewController = container.resolve(AnotherVC.self)
        {
            present(viewController, animated: true)
        }
    }


}

