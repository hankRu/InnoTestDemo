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
            guard let _ = self else { return }
            switch result {
            case .success(let model):
                print(model.first ?? "")
            case .failure(let error):
                print("\(error)")
            }
        }
    }
    
    func filterData(inputString: String) {
        // TODO: 輸入搜尋
    }
}
