//
//  ApiService.swift
//  TezosBakers2
//
//  Created by Андрей Белокопытов on 20.10.2021.
//

import Foundation

extension ApiService {
    func loadData(url: URL, completionHandler: @escaping OnDataLoaded<Model>) {
        var errorMessage: String?
        var result: Model?
        let decoder = JSONDecoder()
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let data = data {
                do {
                    result = try decoder.decode(Model.self, from: data)
                } catch {
                    errorMessage = "Can't parse data"
                }
            }
            if error != nil {
                errorMessage = error?.localizedDescription
            }
            
            // TODO: check response status
            
            DispatchQueue.main.async {
                completionHandler((result, errorMessage))
            }
        }.resume()
    }

}
