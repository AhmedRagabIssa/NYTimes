//
//  MainCoordinator.swift
//  NYTimes
//
//  Created by Fathi2 on 3/10/19.
//

import UIKit

class MainCoordinator {
    private init() { }
    static var shared = MainCoordinator()
    let navigationController = UINavigationController()
    
    func startApplicationFlow() {
        let mainViewModel = MostPopularViewModel()
        let mainViewController = MostPopularViewController(viewModel: mainViewModel)
        navigationController.viewControllers = [mainViewController]
    }
    
}
