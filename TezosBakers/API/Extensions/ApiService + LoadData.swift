//
//  ApiService.swift
//  TezosBakers2
//
//  Created by Андрей Белокопытов on 20.10.2021.
//

import Foundation

extension ApiService {
    static var acceptableHTTPCodes: [Int] {
        return [200]
    }
    
    func loadData(url: URL, completionHandler: OnDataLoaded<Model>?) {
        var errorMessage: String?
        var result: Model?
        let decoder = JSONDecoder()
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard error == nil,
                let data = data,
                let statusCode = (response as? HTTPURLResponse)?.statusCode, Self.acceptableHTTPCodes.contains(statusCode) else {
                DispatchQueue.main.async {
                    completionHandler?((nil, error?.localizedDescription ?? "Server returns error"))
                }
                return
            }

            do {
                result = try decoder.decode(Model.self, from: data)
            } catch {
                errorMessage = "Can't parse data"
            }
            
            DispatchQueue.main.async {
                completionHandler?((result, errorMessage))
            }
        }.resume()
    }

}
