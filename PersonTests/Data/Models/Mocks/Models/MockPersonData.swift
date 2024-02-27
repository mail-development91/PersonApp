//
//  MockData.swift
//  DemoApp
//
//  Created by Amit Kumar on 08/01/24.
//

import Foundation
@testable import Person

final class MockPersonData {
    
    func getError() -> PersonError {
        let error =  PersonError(errorCode: MockConstant.errorCode,
                                 errorMessage: MockConstant.errorMessage)
        return error
    }
    
    func getMockReponse() -> PersonData {
        guard let personData = self.getDataFromJSONFile() else {
            fatalError("No Data Found")
        }
        return personData
    }
    
    func getMockDictionary() -> Data {
        
        let encoded = try! JSONEncoder().encode(self.getMockReponse())
        return encoded
    }
}

extension MockPersonData {
    
    private func getDataFromJSONFile() -> PersonData? {
        do {
            if let filePath = Bundle.main.path(forResource: MockConstant.fileName,
                                               ofType: FileExtensionType.json.rawValue) {
                let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
                let results = try JSONDecoder().decode(PersonData.self,
                                                       from: data)
                return results
            }
        } catch {
            print("----> error: \(error)") 
        }
        return nil
    }
}

extension MockPersonData {
    
    func getImageData() -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: MockConstant.imageName,
                                               ofType: MockConstant.imageType) {
                let imageData = try Data(contentsOf: URL(fileURLWithPath: filePath))
                return imageData
            }
        }
        catch {
            print("----> error: \(error)")
        }
        return nil
    }
}




