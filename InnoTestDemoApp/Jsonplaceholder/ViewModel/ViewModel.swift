//
//  ViewModel.swift
//  InnoTestDemoApp
//
//  Created by Hank Lu on 2021/4/27.
//

import Foundation

class JsonplaceholderViewModel: NSObject {
    
    var reloadData: Observable<Bool> = Observable(false)
    
    var isLoading: Observable<Bool> = Observable(true)
    
    var cellViewModels: [JsonplaceholderData] = []
    
    var filterModels: [JsonplaceholderData] = []
    
    deinit {
        print("deinit: \(type(of: self))")
    }
    
    override init() {
        
    }
    
    func initFetch() {
        self.isLoading.value = true
        ApiManager.shared.getJsonplaceholder { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.cellViewModels = model
                self.filterModels = model
            case .failure(let error):
                print("\(error)")
            }
            self.reloadData.value = true
            self.isLoading.value = false
        }
    }
    
    func filterData(inputString: String) {
        if inputString == "" {
            filterModels = cellViewModels
            self.reloadData.value = true
            return
        }
        filterModels = cellViewModels.filter {$0.title.contains(inputString.lowercased())}
        self.reloadData.value = true
    }
}
