//
//  BaseViewController.swift
//  NYTimes
//
//  Created by Fathi2 on 3/10/19.
//

import UIKit

class BaseViewController: UIViewController {
    
    var viewModel: ViewModelProtocol
    init(viewModel: ViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupContentData()
    }
    
    func setupViews() { }
    func setupConstraints() { }
    func setupContentData() { }
}
