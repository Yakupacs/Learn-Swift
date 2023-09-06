//
//  CryptoViewModel.swift
//  Crypto Crazy MVVM App
//
//  Created by Yakup on 9.06.2023.
//

import Foundation

// MARK: - CRYPTO LIST
struct CryptoListViewModel{
    let cryptoCurrencyList: [CryptoCurrency]
}

extension CryptoListViewModel{
    func numberOfRowsInSection() -> Int{
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel{
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
}

// MARK: - CRYPTO
struct CryptoViewModel{
    let cryptoCurrency : CryptoCurrency
}

extension CryptoViewModel{
    var name : String{
        return cryptoCurrency.currency
    }
    
    var price : String{
        return cryptoCurrency.price
    }
}
