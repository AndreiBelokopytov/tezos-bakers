//
//  FormattableNumber.swift
//  TezosBaking
//
//  Created by Андрей Белокопытов on 15.10.2021.
//

import Foundation

protocol FormattableNumber {}

extension FormattableNumber {
    func format(formatter: NumberFormatter) -> String? {
        guard let number = self as? NSNumber else {
            fatalError("Type is not assignable to NSNumber")
        }
        return formatter.string(from: number)
    }
}
