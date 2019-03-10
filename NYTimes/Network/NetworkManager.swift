//
//  NetworkManager.swift
//  NYTimes
//
//  Created by Fathi on 3/10/19.
//

import Foundation

class NetworkManager {
    private init() { }
    static var shared = NetworkManager()
    let decoder = JSONDecoder()
    
    private final var period = 7
    private final var apiKey = "EXK9F11pQ8bbXLUNGAbABgurpsSQHMlG"
    
    typealias ArticlesResposne = (_ articles: [Article]?, _ error: Error?) -> Void
    func requestArticles(completion: @escaping ArticlesResposne) {
        
        guard let url = URL(string: "http://api.nytimes.com/svc/mostpopular/v2/viewed/\(period).json?api-key=\(apiKey)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(nil, error)
                return
            }
            
            do {
                let response = try self.decoder.decode(Response.self, from: data!)
                DispatchQueue.main.async {
                    completion(response.results, nil)
                }
            } catch {
                completion(nil, error)
            }
            
        }.resume()
    }
    
}
