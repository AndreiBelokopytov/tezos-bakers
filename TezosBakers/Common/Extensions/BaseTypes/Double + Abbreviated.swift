//
//  AbbreviatedNumber.swift
//  TezosBaking
//
//  Created by Андрей Белокопытов on 15.10.2021.
//

import Foundation

extension Double {
    typealias AbbreviationOption = (abbreviation: String, capacity: Double)
    
    func abbreviated(with options: [AbbreviationOption]? = nil, formatter: NumberFormatter? = nil) -> String {
        var value = self
        
        let defaultOptions: [AbbreviationOption] = [("B", 100000000), ("M", 1000000), ("K", 1000)]
        let options = options ?? defaultOptions
        var abbreviation = ""

        for item in options.sorted(by: { $0.capacity > $1.capacity }) {
            if abs(value) >= item.capacity {
                value = value / item.capacity
                abbreviation = item.abbreviation
                break
            }
        }
        
        let defaultFormatter = NumberFormatter()
        defaultFormatter.numberStyle = .decimal
        defaultFormatter.usesGroupingSeparator = false
        defaultFormatter.maximumFractionDigits = value > 100 ? 0 : 1
        
        let formattedValue = value.format(formatter: formatter ?? defaultFormatter) ?? ""
        return "\(formattedValue)\(abbreviation)"
    }
}
