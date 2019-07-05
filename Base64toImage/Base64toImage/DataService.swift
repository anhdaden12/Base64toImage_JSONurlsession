//
//  DataService.swift
//  Base64toImage
//
//  Created by Admin on 02/07/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit


class DataService {
    static var shareIntance: DataService = DataService()
    
    func getData(completedHandle: @escaping(Weather) -> Void) {
        guard let url = URL(string: "http://api.apixu.com/v1/current.json?key=0cdf7bbccfb6472bb6a23742192606&q=Paris") else {return}
        
        let urlRequest = URLRequest(url: url)
        
        let dowloadTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: {(data, response, error) in
            guard let aData = data else {return}
            do {
                let receiveData = try JSONDecoder().decode(Weather.self, from: aData)
                DispatchQueue.main.async {
                    completedHandle(receiveData)
                }
            } catch {
                print(error)
            }
        })
        dowloadTask.resume()
    }
}
