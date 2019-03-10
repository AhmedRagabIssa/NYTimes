//
//  BaseTableCell.swift
//  NYTimes
//
//  Created by Fathi2 on 3/10/19.
//

import UIKit

class BaseTableCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        setupContentData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() { }
    func setupConstraints() { }
    func setupContentData() { }
    
}
