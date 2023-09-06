import UIKit
import Foundation

let address = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/littleLemonSimpleMenu.json"

let url = URL(string: address)

guard let url = url else { throw NSError() }

var request = URLRequest(url: url)

URLSession.shared.dataTask(with: request) { data, response, error in
    if let data = data, let responseString = String(data: data, encoding: .utf8)
    {
        print(responseString)
    }
}.resume()
