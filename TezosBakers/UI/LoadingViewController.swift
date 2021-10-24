//
//  LoadingViewController.swift
//  TezosBakers2
//
//  Created by Андрей Белокопытов on 19.10.2021.
//

import Foundation
import UIKit

class LoadingViewController: UIViewController {
    @IBOutlet weak var activityInicator: UIActivityIndicatorView?
    @IBOutlet weak var statusText: UILabel?
    
    override func viewDidLoad() {
        activityInicator?.startAnimating()
    }
}
