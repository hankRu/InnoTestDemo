//
//  JsonplaceholderVC.swift
//  InnoTestDemoApp
//
//  Created by Hank Lu on 2021/4/27.
//

import UIKit

class JsonplaceholderVC: UITableViewController, UISearchResultsUpdating {
    
    lazy var vm: JsonplaceholderViewModel = {
        return JsonplaceholderViewModel()
    }()
    
    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(vm: vm)
        setupUI()
        setupSearchController()
        vm.initFetch()
    }
    
    private func bind(vm: JsonplaceholderViewModel) {
        vm.reloadData.addObserver {  (value) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.backgroundView?.isHidden = self.vm.filterModels.count > 0
            }
        }
        
        vm.isLoading.addObserver { (isLoading) in
            DispatchQueue.main.async {
                if isLoading {
                    FCLoadingDialog.shared.presentInWindow()
                } else {
                    FCLoadingDialog.shared.dismissSelf()
                }
            }
        }
    }
}

extension JsonplaceholderVC {
    // MARK: - UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            vm.filterData(inputString: searchText)
        }
    }
}

extension JsonplaceholderVC {
    private func setupUI() {
        tableView.register(JsonplaceholderTableViewCell.self, forCellReuseIdentifier: JsonplaceholderTableViewCell.className)
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: CGRect.init(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude))
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        tableView.setEmptyMessage("很抱歉，目前無資料")
        tableView.backgroundView?.isHidden = true
        self.tableView.keyboardDismissMode = .onDrag
    }
    
    private func setupSearchController(){
        searchController = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = searchController?.searchBar
        searchController?.searchResultsUpdater = self
        searchController?.searchBar.placeholder = "搜尋"
        searchController?.obscuresBackgroundDuringPresentation = false
    }
}

extension JsonplaceholderVC {
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.filterModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JsonplaceholderTableViewCell.className, for: indexPath)
        (cell as? CellConfigurable)?.setup(viewModel: vm.filterModels[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchController?.searchBar.endEditing(false)
        let rowViewModel = vm.filterModels[indexPath.row]
        print("\(rowViewModel.title)")
    }
}
