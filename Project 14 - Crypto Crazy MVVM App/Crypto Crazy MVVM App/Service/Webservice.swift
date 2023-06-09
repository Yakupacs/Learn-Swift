//
//  Webservice.swift
//  Crypto Crazy MVVM App
//
//  Created by Yakup on 9.06.2023.
//

import Foundation

class Webservice{
    
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data{
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                
                
                if let cryptoList = cryptoList{
                    print(cryptoList)
                    completion(cryptoList)
                }
            }
        }.resume()
        
    }
    
}
