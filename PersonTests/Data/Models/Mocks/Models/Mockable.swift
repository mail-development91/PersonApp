//
//  Mockable.swift
//  TestableNetworkLayerTest
//
//  Created by Muhammed Celal Tok on 2.08.2022.
//

import Foundation
@testable import Person

enum FileExtensionType: String {
    case json = ".json"
}

protocol Mockable: AnyObject {
    
    func loadJson<T: Decodable>(filename: String,
                                extensionType: FileExtensionType,
                                type: T.Type,
                                isError: Bool,
                                completion: @escaping (Result<T, Error>) -> Void)
}

extension Mockable {
    
    func loadJson<T: Decodable>(filename: String, extensionType: FileExtensionType, type: T.Type, isError: Bool, completion: @escaping (Result<T, Error>) -> Void) {
        
        if isError {
            completion(.failure(NetworkError.badResponse))
        }
        
        guard let path = Bundle.main.path(forResource: "PersonData", ofType: "json") else {
            fatalError("Failed to load Json file.")
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoedObject = try JSONDecoder().decode(T.self, from: data)
            if !isError {
                completion(.success(decoedObject))
            }
            
        } catch {
            print("❌ \(error)")
            fatalError("Failed to decoed the Json.")
        }
    }
}
