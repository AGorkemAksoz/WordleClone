//
//  Statistic.swift
//  WordleClone
//
//  Created by Ali Görkem Aksöz on 12.01.2025.
//

import Foundation

struct Statistic: Codable {
    var frequencies = [Int](repeating: 0, count: 6)
    var games = 0
    var streak = 0
    var maxStreak = 0
    
    var wins: Int {
        frequencies.reduce(0, +)
    }
    
    func saveStat() {
        if let encoded = try? JSONEncoder().encode(self) {
            UserDefaults.standard.setValue(encoded, forKey: "Stat")
        }
    }
    
    static func loadStat() -> Statistic {
        if let savedStat = UserDefaults.standard.value(forKey: "Stat") as? Data {
            if let currentStat =  try? JSONDecoder().decode(Statistic.self, from: savedStat) {
                return currentStat
            } else {
                return Statistic()
            }
        } else {
            return Statistic()
        }
    }
    
    mutating func update(win: Bool, index: Int? = nil) {
        games += 1
        streak = win ? streak + 1 : 0
        if win {
            frequencies[index!] += 1
            maxStreak = max(maxStreak, streak)
        }
        saveStat()
    }
}
