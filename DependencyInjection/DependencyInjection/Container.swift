//
//  Container.swift
//  DependencyInjection
//
//  Created by Yakup on 31.08.2023.
//

import Foundation
import Swinject

// MARK: Dependency Injection
// Bir class'ın veya nesnenin bağımlılıklarından kurtulmasını amaçlayan bir programlama prensibidir. Unit test yazmayı hem kolaylaştırır hem de doğruluk payını arttırır.
// Dependency Injection yazılım içerisindeki componentlerin "loosely coupled" gevşek bağlı olmasını sağlayan önemli prensiplerden biridir.
// Böylece sınıflar birbirinden bağımsız olur ve tek başlarına test edilebilir.

let container : Container =
{
    let container = Container()
    
    container.register(BackgroundProvidingClass.self) { resolver in
        return BackgroundProvidingClass()
    }
    
    container.register(AnotherVC.self) { resolver in
        let vc = AnotherVC(providerProtocol: resolver.resolve(BackgroundProvidingClass.self))
        return vc
    }
    
    return container
}()
