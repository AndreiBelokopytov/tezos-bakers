//
//  DefaultEndpointProvider.swift
//  TezosBaking
//
//  Created by Андрей Белокопытов on 14.10.2021.
//

import Foundation

class DefaultEndpointProvider: EndpointProvider {
    static let shared = DefaultEndpointProvider()
    
    let baseUrl = URL(string: "https://api.baking-bad.org/v2/")!
    
    let bakers = "bakers"
}
