//
//  BakerListViewControllerAdapter.swift
//  TezosBakers2
//
//  Created by Андрей Белокопытов on 23.10.2021.
//

import Foundation

class BakersServiceAdapter: BakerListViewControllerDelegate {
    private var _bakersService = BakersService(endpointProvider: DefaultEndpointProvider.shared)
    
    func needsLoadBakers(_ controller: BakerListViewController, onLoadingFinished: OnLoadingFinished?) {
        _bakersService.loadData(query: BakersQuery.defaultQuery) {[weak controller] result in
            let items = (result.data ?? []).map { BakerListItemVM(baker: $0) }
            controller?.items = items
            controller?.errorMessage = result.errorMessage
            onLoadingFinished?()
        }
    }
}
