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
    
    internal var _logo: String?
}
