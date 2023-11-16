//
//  DataManager.swift
//  BooksApp
//
//  Created by Yuliya on 10/11/2023.
//

import Foundation
import Alamofire

protocol DataManagerProtocol {
//    func getData<T: Decodable>(url: String, completion: @escaping (Result<[T]?, Error>) -> ()) where T : Decodable
    func getData(url: String, completion: @escaping (Result<[User]?, Error>) -> ())
}

final class DataManager: DataManagerProtocol {

    func getData(url: String, completion: @escaping (Result<[User]?, Error>) -> ()) {

        AF.request(url, method: .get, encoding: JSONEncoding.default)
            .responseData { responseData in
                guard let data = responseData.data else {
                    if let error = responseData.error {
                        completion(.failure(error))
                    }
                    return
                }
                do {
                    let authorsData = try JSONDecoder().decode(Users.self, from: data)
                    completion(.success(authorsData.results))
                } catch {
                    completion(.failure(error))
                }
            }
    }
}


// MARK: - Users
struct Users: Codable {
    let count: Int
    let next: String
    let results: [User]
}

// MARK: - User
struct User: Codable {
    let name: String
    let url: String
}
