//
//  SpinnerCompatible.swift
//  NYTimes
//
//  Created by Fathi on 3/10/19.
//

import UIKit

protocol SpinnerCompatible {
    func showSpinner(color: UIColor)
    func hideSpinner()
}

extension SpinnerCompatible where Self: UIView {
    
    fileprivate var spinner: UIActivityIndicatorView {
        for subview in subviews {
            if let spinner = subview as? UIActivityIndicatorView {
                return spinner
            }
        }
        
        let spinner = UIActivityIndicatorView(style: .white)
        if frame.width > 40 && frame.height > 40 {
            spinner.style = .whiteLarge
        }
        spinner.hidesWhenStopped = true
        addSubview(spinner)
        bringSubviewToFront(spinner)
        spinner.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        return spinner
    }
    
    func showSpinner(color: UIColor = .gray) {
        isUserInteractionEnabled = false
        spinner.color = color
        spinner.startAnimating()
    }
    
    func hideSpinner() {
        isUserInteractionEnabled = true
        spinner.stopAnimating()
    }
}

extension UIView: SpinnerCompatible { }
