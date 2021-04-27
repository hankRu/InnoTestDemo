//
//  JsonplaceholderTableViewCell.swift
//  InnoTestDemoApp
//
//  Created by Hank Lu on 2021/4/27.
//

import UIKit
import SnapKit
import Kingfisher

class JsonplaceholderTableViewCell: UITableViewCell, CellConfigurable {
    
    let cellImageView = UIImageView(frame: .zero)
    let cellLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupUI() {
        contentView.addSubview(cellImageView)
        contentView.addSubview(cellLabel)
        cellImageView.snp.makeConstraints { (make) in
            make.center.equalTo(contentView)
            make.width.height.equalTo(100)
        }
        cellLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(cellImageView.snp.bottom)
            make.bottom.equalToSuperview()
        }
        cellLabel.textColor = .black
    }
    
    func setup(viewModel: RowViewModel) {
        guard let viewModel = viewModel as? JsonplaceholderData else { return }
        cellLabel.text = viewModel.title
        if let url = URL(string: viewModel.url) {
            cellImageView.kf.setImage(with: url)
        }
    }
}
