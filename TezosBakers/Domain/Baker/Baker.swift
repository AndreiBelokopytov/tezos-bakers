//
//  Baker.swift
//  TezosBaking
//
//  Created by Андрей Белокопытов on 03.10.2021.
//

import Foundation

struct Baker: Codable {
    var address: String
    var name: String
    var logo: String?
    var balance: Double
    var stakingBalance: Double
    var freeSpace: Double
    var minDelegation: Double
    var estimatedRoi: Double
    var fee: Double
}
