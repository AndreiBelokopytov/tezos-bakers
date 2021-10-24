//
//  BakerQuery.swift
//  TezosBaking
//
//  Created by Андрей Белокопытов on 12.10.2021.
//

import Foundation

struct BakersQuery {
    var health: BakerHealth = .active
    var accuracy: BakerAccuracy?
    var payoutTiming: BakerPayoutTiming?
    var serviceType: [BakerServiceType]? = [.tezos_only, .multiasset]
    
    static var defaultQuery = BakersQuery()
    
    var queryItems: [URLQueryItem] {
        [
            URLQueryItem(name: "health", value: health.rawValue),
            serviceType != nil ?
                URLQueryItem(name: "type", value: serviceType?.map({ $0.rawValue }).joined(separator: ",")) : nil
        ].compactMap { $0 }
    }
}
