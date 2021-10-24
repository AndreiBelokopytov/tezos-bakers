//
//  UIView + Utils.swift
//  TezosBakers
//
//  Created by Андрей Белокопытов on 24.10.2021.
//

import Foundation
import UIKit

extension UIView {
    func constraintsForAnchoringTo(boundsOf view: UIView) -> [NSLayoutConstraint] {
        return [
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
    }
    
    func constraintsForAnchoringTo(marginsOf view: UIView) -> [NSLayoutConstraint] {
        return [
            topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ]
    }
    
    func constraintsForAnchoringTo(safeAreaOf view: UIView) -> [NSLayoutConstraint] {
        return [
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ]
    }
    
    func constraintsForEqualSize(size: CGFloat) -> [NSLayoutConstraint] {
        return [
            widthAnchor.constraint(equalTo: heightAnchor),
            heightAnchor.constraint(equalToConstant: size)
        ]
    }
}
