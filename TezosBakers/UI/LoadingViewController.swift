//
//  LoadingViewController.swift
//  TezosBakers2
//
//  Created by Андрей Белокопытов on 19.10.2021.
//

import Foundation
import UIKit

class LoadingViewController: UIViewController {
    private var _activityIndicator: UIActivityIndicatorView = {
        UIActivityIndicatorView()
    }()
    
    private var _statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Loading..."
        return label
    }()
    
    private var _horizontalContainer: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 8
        return stack
    }()
    
    private var _verticalContainer: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        _prepareView()
        _addConstraints()
        _activityIndicator.startAnimating()
    }
    
    private func _prepareView() {
        _horizontalContainer.addArrangedSubview(_activityIndicator)
        _horizontalContainer.addArrangedSubview(_statusLabel)

        _verticalContainer.addArrangedSubview(_horizontalContainer)

        view.addSubview(_verticalContainer)
    }
    
    private func _addConstraints() {
        let verticalContainerConstraints = _verticalContainer.constraintsForAnchoringTo(boundsOf: view)

        NSLayoutConstraint.activate(verticalContainerConstraints)
    }
}
