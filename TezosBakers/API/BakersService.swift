//
//  BakersStore.swift
//  TezosBaking
//
//  Created by Андрей Белокопытов on 03.10.2021.
//

import Foundation

class BakersService: ApiService {
    
    typealias Model = [Baker]
    typealias Query = BakersQuery
    
    var endpointProvider: EndpointProvider

    init(endpointProvider: EndpointProvider) {
        self.endpointProvider = endpointProvider
    }
    
    func loadData(query: BakersQuery, completionHandler: @escaping OnDataLoaded<[Baker]>) {
        guard let url = _buildURL(from: query) else {
            let errorMessage = "Can't instantiate bakers URL"
            completionHandler((data: [], errorMessage))
            return
        }
        loadData(url: url, completionHandler: completionHandler)
    }
    
    private func _buildURL(from query: BakersQuery) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.path = endpointProvider.bakers
        urlComponents.queryItems = query.queryItems
        return urlComponents.url(relativeTo: endpointProvider.baseUrl)
    }
}
