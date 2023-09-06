import UIKit
import Foundation

var components = URLComponents()
components.path = "Meta-Mobile-Developer-PC/Working-With-Data-API/main/littleLemonSimpleMenu.json"
components.scheme = "https"
components.host = "raw.githubusercontent.com"
let menuAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/littleLemonSimpleMenu.json"

let menuURL = URL(string: menuAddress)

guard let menuURL = menuURL else {
    throw NSError()
}

var request = URLRequest(url: menuURL)

let task = URLSession.shared.dataTask(with: menuURL){ data, response, error in
    if let data = data, let responseString = String(data: data, encoding: .utf8)
    {
//        print(responseString)
    }
}
task.resume()


// MARK: - Download Data
//let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/littleLemonSimpleMenu.json")
//var requestt = URLRequest(url: url!)
//let downloadTask = URLSession.shared.downloadTask(with: requestt) { url, response, error in
//    print(url)
//}
//downloadTask.resume()

