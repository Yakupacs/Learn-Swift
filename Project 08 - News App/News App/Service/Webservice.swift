//
//  Webservice.swift
//  News App
//
//  Created by Yakup Acis on 8/21/22.
//

import Foundation

class Webservice {
    
    func newDownload(url: URL, completion: @escaping ([News]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data{
                
                let newsArray = try? JSONDecoder().decode([News].self, from: data)
                if let newsArray = newsArray {
                    completion(newsArray)
                }
            }
            
        }.resume()
        
    }
}
