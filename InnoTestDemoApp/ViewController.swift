//
//  ViewController.swift
//  InnoTestDemoApp
//
//  Created by Hank Lu on 2021/4/27.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var vm: JsonplaceholderViewModel = {
        return JsonplaceholderViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(vm: vm)
    }
    
    private func bind(vm: JsonplaceholderViewModel) {
        vm.reloadData.addObserver {  (value) in
            
        }
    }
}
