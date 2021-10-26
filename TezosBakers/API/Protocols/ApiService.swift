//
//  ApiService.swift
//  TezosBakers2
//
//  Created by Андрей Белокопытов on 20.10.2021.
//

import Foundation

protocol ApiService {
    
    associatedtype Model: Codable
    associatedtype Query
    
    typealias OnDataLoaded<T: Codable> = (_: (data: Model?, errorMessage: String?)) -> Void
    
    var endpointProvider: EndpointProvider { get }
    
    func loadData(query: Query, completionHandler: OnDataLoaded<Model>?)
}
