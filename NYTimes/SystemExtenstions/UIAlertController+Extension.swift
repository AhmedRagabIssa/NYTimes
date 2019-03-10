//
//  UIAlertController+Extension.swift
//  NYTimes
//
//  Created by Fathi on 3/10/19.
//

import UIKit

extension UIAlertController {
    
    static func alert(title: String? = nil, message: String? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        return alert
    }
    
    func addOk(handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        addAction(UIAlertAction(title: "Ok", style: .default, handler: handler))
        return self
    }
    
    func addCancel(handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: handler))
        return self
    }
    
    func present(on sourceViewController: UIViewController, completion: (() -> Void)? = nil) {
        sourceViewController.present(self, animated: true, completion: completion)
    }
    
}
