//
//  StandingsList.swift
//  F1Standings
//
//  Created by Scott Cox on 5/30/22.
//

import Foundation

struct TopLevelDictionary: Decodable {
    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
    let mrData: ResponseDetails
}

struct ResponseDetails: Decodable {
    enum CodingKeys: String, CodingKey {
        case standings = "StandingsTable"
    }
    let standings: Standings
}

struct Standings: Decodable {
    enum CodingKeys: String, CodingKey {
        case list = "StandingLists"
    }
    let list: [DriverStandings]
}

struct DriverStandings: Decodable {
    enum CodingKeys: String, CodingKey {
        case drivers = "DriverStandings"
        case season
        case round
    }
    let drivers: [Driver]
    let season: String
    let round: String
}

struct Driver: Decodable {
    enum CodingKeys: String, CodingKey {
        case position
        case points
        case driverDetails = "Driver"
        case constructors = "Constructors"
    }
    let position: String
    let points: String
    let driverDetails: DriverDetails
    let constructors: [Constructor]
}

struct DriverDetails: Decodable {
    let givenName: String
    let familyName: String
    let nationality: String
}

struct Constructor: Decodable {
    let name: String
}
