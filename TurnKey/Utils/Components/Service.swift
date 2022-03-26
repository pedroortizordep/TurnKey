//
//  Service.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 26/03/22.
//

import Foundation

class Service {
    
    typealias result<T> = (Result<T, Error>) -> Void
    
    internal func parseJSON<T: Decodable>(
        of _: T.Type,
        jsonFileName: String,
        completion: @escaping result<T>) {
            
        guard let path = Bundle.main.path(
            forResource: jsonFileName,
            ofType: "json"
        ) else { return }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url)
            let decodedData: T = try JSONDecoder().decode(T.self, from: jsonData)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
}
