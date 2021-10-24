//
//  UIView.swift
//  TezosBakers2
//
//  Created by Андрей Белокопытов on 19.10.2021.
//

import UIKit

extension UIViewController {
    func showChild(view child: UIViewController) {
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func hideChild(view child: UIViewController) {
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}
