//
//  BoredHelper.swift
//  Oracle
//
//  Created by Lee, Christopher on 11/20/21.
//

import Foundation

enum BoredHelperResult: Error {
    case Success(Bored)
    case Failure(Error)
}

class BoredHelper {
    
    let fmpURL = "https://www.boredapi.com/api/activity?type=education"
    
    private func getAction(from data: Data) -> BoredHelperResult {
        do {
            let decoder = JSONDecoder()
            //print(decoder)
            let bored = try decoder.decode(Bored.self, from: data)
            return .Success(bored)
        } catch let error {
            return .Failure(error)
        }
    }
    
    func fetchAction( completion: @escaping (BoredHelperResult) -> Void) {
        
        if let url = URL(string: fmpURL) {
            
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let boredData = data else {
                    if let err = error {
                        completion(.Failure(err))
                    }
                    return
                }
                completion(self.getAction(from: boredData))
            }
            task.resume()
        } else {
            completion(.Failure(URLError.BadURL))
        }
    }
    
}
