//
//  BackgroundProvidingClass.swift
//  DependencyInjection
//
//  Created by Yakup on 31.08.2023.
//

import Foundation
import UIKit

class BackgroundProvidingClass : BackgroundProviderProtocol
{
    var backgroundColor: UIColor {
        let backgroundColors : [UIColor] = [.systemCyan,
                                            .systemMint,
                                            .systemTeal,
                                            .systemIndigo,
                                            .systemRed,
                                            .cyan,
                                            .darkGray,
                                            .orange]
        return backgroundColors.randomElement()!
    }
    
}
