//
//  NetworkService.swift
//  F1Standings
//
//  Created by Scott Cox on 5/30/22.
//

import Foundation

class F1NetworkService {
    
    let sharedInstance = F1NetworkService()
    
    // SOT
    var driverStandings: DriverStandings?
    
    private let baseURL = "http://ergast.com/api/f1"

    //CRUD
    func fetchDriversStandings(completion: @escaping(DriverStandings?) -> Void) {
        guard var url = URL(string: baseURL) else {
            return
        }
        url.appendPathComponent("2022")
        url.appendPathComponent("driverStandings")
        url.appendPathExtension("json")
        print(url.absoluteString)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let decoder = JSONDecoder()
                let topLevel = try decoder.decode(TopLevelDictionary.self, from: data)
                let driverStandings = topLevel.mrData.standings.list.first
                completion(driverStandings)
            } catch {
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
} // End of class


