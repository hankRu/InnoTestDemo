//
//  TableViewModel.swift
//  InnoTestDemoApp
//
//  Created by Hank Lu on 2021/4/27.
//
import Foundation
import UIKit

protocol RowViewModel {}

protocol CellConfigurable where Self: UITableViewCell {
    func setup(viewModel: RowViewModel)
}

extension CellConfigurable {
    func setup(viewModel: RowViewModel) {}
}
