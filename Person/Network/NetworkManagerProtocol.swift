//
//  NetworkModule.swift
//  DemoApp
//
//  Created by Amit Kumar on 04/01/24.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetch<T: Codable>(url: URL,
                           completion: @escaping (Result<T, Error>) -> Void)
    func fetchImage(url: URL, completion:@escaping (Data?, Error?) -> ())
}
