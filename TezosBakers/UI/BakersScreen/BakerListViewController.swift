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

    private let _delegate = BakerListViewControllerDefaultDelegate()
    
    private var _loading: LoadingViewController = {
        LoadingViewController()
    }()
    
    private var _search: UISearchController = {
        let searchController = UISearchController()
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.isOpaque = true
        navigationController?.navigationBar.autoresizesSubviews = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        _search.searchBar.delegate = self
        
        navigationItem.title = "Bakers"
        navigationItem.searchController = _search
        navigationItem.hidesSearchBarWhenScrolling = false
        
        _loadBakers()
    }
    
    func showLoading() {
        showChild(view: _loading)
    }
    
    func hideLoading() {
        hideChild(view: _loading)
    }
    
    private func _loadBakers() {
        _delegate.needsLoadBakers(self)
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
    static var identifier = "BakersTableCell"
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
