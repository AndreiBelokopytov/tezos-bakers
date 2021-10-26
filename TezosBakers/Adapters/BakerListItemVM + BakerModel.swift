//
//  BakerListItemVM + BakerModel.swift
//  TezosBakers
//
//  Created by Андрей Белокопытов on 26.10.2021.
//

import Foundation

extension BakerListItemVM {
    init(baker: Baker) {
        _logo = baker.logo
        name = baker.name
        staking = baker.stakingBalance.abbreviated()
        freeSpace = baker.freeSpace.abbreviated()
        fee = String(format: "%.2f%%", baker.fee * 100)
    }
}
