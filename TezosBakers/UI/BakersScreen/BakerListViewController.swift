//
//  BakerListViewController.swift
//  TezosBakers2
//
//  Created by Андрей Белокопытов on 16.10.2021.
//

import Foundation
import UIKit
import SDWebImage

class BakerListViewController: UIViewController {
    var errorMessage: String? = nil
    
    var searchText = "" {
        didSet {
            tableView.reloadData()
        }
    }
    
    var items: [BakerListItemVM] {
        get {
            _items
            .filter {
                !searchText.isEmpty ?
                $0.name.lowercased().starts(with: searchText.lowercased()) : true
            }
        }
        
        set {
            _items = newValue
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    private var _items = [BakerListItemVM]()
    private let _bakersService = BakersService(endpointProvider: DefaultEndpointProvider.shared)
    private var _loading: LoadingViewController?
    private let _delegate = BakerListViewControllerDefaultDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Bakers"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController()
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false

        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        tableView.dataSource = self
        tableView.allowsSelection = false
        
        _loading = storyboard?.instantiateViewController(withIdentifier: "LoadingViewController") as? LoadingViewController
        
        loadBakers()
    }
    
    func loadBakers() {
        _delegate.needsLoadBakers(self)
    }
    
    func showLoading() {
        if let loading = _loading {
            hideChild(view: loading)
        }
    }
    
    func hideLoading() {
        if let loading = _loading {
            hideChild(view: loading)
        }
    }
}

extension BakerListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BakersTableCell.identifier, for: indexPath) as? BakersTableCell
        let model = _items[indexPath.row]
        
        cell?.update(model: model)
        return cell!
    }
}

extension BakerListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchText = ""
    }
}

class BakersTableCell: UITableViewCell {
    static var identifier = "BakerTableCell"
    static let logoPlaceholder = UIImage(named: "dummy_32x32_ffffff_cccccc")
    
    @IBOutlet weak var bakerImage: SDAnimatedImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stakingLabel: UILabel!
    @IBOutlet weak var freeSpaceLabel: UILabel!
    @IBOutlet weak var feeLabel: UILabel!
    
    func update(model: BakerListItemVM) {
        bakerImage.sd_setImage(with: model.logo, placeholderImage: BakersTableCell.logoPlaceholder)
        nameLabel?.text = model.name
        stakingLabel?.text = model.staking
        freeSpaceLabel?.text = model.freeSpace
        feeLabel?.text = model.fee
    }
}
