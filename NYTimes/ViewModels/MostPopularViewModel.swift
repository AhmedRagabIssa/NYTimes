//
//  MostPopularViewModel.swift
//  NYTimes
//
//  Created by Fathi2 on 3/10/19.
//

import Foundation

class MostPopularViewModel: ViewModelProtocol {
    
    let title = "NYTimes"
    var articles = [Article]()
    var currentlyAnimatingCells = 0
    var animatedCells = [IndexPath]()
    
    func getArticles(completion: @escaping (_ error: Error?) -> Void) {
        NetworkManager.shared.requestArticles { articles, error in
            self.articles = articles ?? []
            completion(error)
        }
    }
    
}
