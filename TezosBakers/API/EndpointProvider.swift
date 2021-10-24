//
//  ApiProvider.swift
//  TezosBaking
//
//  Created by Андрей Белокопытов on 10.10.2021.
//

import Foundation

protocol EndpointProvider {
    var baseUrl: URL { get}
    var bakers: String { get }
}
