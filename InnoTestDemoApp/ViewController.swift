//
//  ViewController.swift
//  InnoTestDemoApp
//
//  Created by Hank Lu on 2021/4/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
}
