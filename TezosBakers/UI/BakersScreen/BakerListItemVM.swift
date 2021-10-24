//
//  BakersListItemVM.swift
//  TezosBakers2
//
//  Created by Андрей Белокопытов on 23.10.2021.
//

import Foundation

struct BakerListItemVM {
    let name: String
    let staking: String
    let freeSpace: String
    let fee: String
    
    var logo: URL? {
        if let logo = _logo {
            return URL(string: logo)
        }
        return nil
    }
    
    private var _logo: String?
}

extension BakerListItemVM {
    init(baker: Baker) {
        _logo = baker.logo
        name = baker.name
        staking = baker.stakingBalance.abbreviated()
        freeSpace = baker.freeSpace.abbreviated()
        fee = String(format: "%.2f%%", baker.fee * 100)
    }
}
