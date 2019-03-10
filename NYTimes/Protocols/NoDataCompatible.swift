//
//  NoDataCompatible.swift
//  NYTimes
//
//  Created by Fathi on 3/10/19.
//

import UIKit

protocol NoDataCompatible {
    func showNoData(_ message: String)
    func hideNoData()
}

private let kTagNoDataLabel = 291139

extension NoDataCompatible where Self: UIView {
    
    var label: UILabel {
        
        if let label = viewWithTag(kTagNoDataLabel) as? UILabel {
            return label
        }
        
        let label = UILabel()
        label.numberOfLines = 0
        label.tag = kTagNoDataLabel
        label.textAlignment = .center
        label.textColor = .darkGray
        addSubview(label)
        bringSubviewToFront(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(25)
        }
        return label
    }
    
    func showNoData(_ message: String) {
        label.text = message
        label.isHidden = false
    }
    
    func hideNoData() {
        label.text = nil
        label.isHidden = true
    }
    
}

extension UIView: NoDataCompatible { }
