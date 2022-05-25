//
//  UserDefaultsService.swift
//  WordleGame
//
//  Created by Alex on 26.05.22.
//

import Foundation

class UserDefaultsService {
    private init() { }
    
    static let shared = UserDefaultsService()
    
    func saveGameResult(_ gameResult: GameResult) {
        var gameResults = getGameResults()
        gameResults.append(gameResult)
        
        guard let encodedObjects = try? JSONEncoder().encode(gameResults) else {
            return
        }
        
        UserDefaults.standard.set(encodedObjects, forKey: UserDefaultsKey.results.rawValue)
    }
    
    func getGameResults() -> [GameResult] {
        guard let data = UserDefaults.standard.data(forKey: UserDefaultsKey.results.rawValue),
              let decodedObjects = try? JSONDecoder().decode([GameResult].self, from: data)else {
            return []
        }
        
        return decodedObjects
    }
}

enum UserDefaultsKey: String {
    case results
}
