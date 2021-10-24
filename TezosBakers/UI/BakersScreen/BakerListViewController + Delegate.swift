//
//  BakerListViewControllerAdapter.swift
//  TezosBakers2
//
//  Created by Андрей Белокопытов on 23.10.2021.
//

import Foundation

protocol BakerListViewControllerDelegate {
    typealias LoadCompleteCallback = (_ items: [BakerListItemVM], _ errorMessage: String?) -> Void
    func needsLoadBakers(_ controller: BakerListViewController)
}

class BakerListViewControllerDefaultDelegate: BakerListViewControllerDelegate {
    private var _bakersService = BakersService(endpointProvider: DefaultEndpointProvider.shared)
    
    func needsLoadBakers(_ controller: BakerListViewController) {
        controller.showLoading()
        _bakersService.loadData(query: BakersQuery.defaultQuery) {[weak controller] result in
            let items = (result.data ?? [])
                .sorted(by: { $0.stakingBalance > $1.stakingBalance })
                .map { BakerListItemVM(baker: $0) }
            controller?.items = items
            controller?.errorMessage = result.errorMessage
            controller?.hideLoading()
        }
    }
}
