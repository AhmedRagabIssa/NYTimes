//
//  MostPopularTableCell.swift
//  NYTimes
//
//  Created by Fathi2 on 3/10/19.
//

import UIKit

class MostPopularTableCell: BaseTableCell {
    
    static var identifier = "MostPopularTableCell"
    
    var article: Article! {
        didSet {
            titleLabel.text = article.title
            descLabel.text = article.abstract
            dateLabel.text = article.publishedDate
        }
    }
    
    let imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.rounded(30)
        imgView.backgroundColor = .red
        return imgView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.numberOfLines = 2
        label.text = "TitleLabel"
        return label
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 0
        label.text = "Desc Label Desc Label Desc Label Desc Label Desc Label Desc Label Desc Label Desc Label Desc Label"
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.text = "2017-06-23"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(imgView)
        addSubview(titleLabel)
        addSubview(descLabel)
        addSubview(dateLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        imgView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(16)
            $0.top.greaterThanOrEqualToSuperview().inset(16)
            $0.width.equalTo(imgView.snp.height)
            $0.width.equalTo(60)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(35)
            $0.leading.equalTo(imgView.snp.trailing).offset(16)
        }
        
        descLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalTo(titleLabel)
        }
        
        dateLabel.snp.makeConstraints {
            $0.trailing.equalTo(descLabel)
            $0.top.equalTo(descLabel.snp.bottom).offset(4)
            $0.bottom.equalToSuperview().offset(-10)
        }
    }
    
    override func setupContentData() {
        super.setupContentData()
    }
    
}
