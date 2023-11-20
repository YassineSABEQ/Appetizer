//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Yassine Sabeq on 30/10/2023.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizerURL) else {
            throw APIError.invalidURL
        }
        
        //data and response are not optional
        let (data, response) = try await URLSession.shared.data(from: url)
        
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(AppetizerResponse.self, from: data).response
        } catch {
            throw APIError.invalidData
        }
        
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
