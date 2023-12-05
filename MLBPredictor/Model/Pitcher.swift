import Foundation

struct Pitcher {
    var id: String
    var name: String
    var team: String
    var stats: PitcherStats
}

struct PitcherStats {
    var gamesPlayed: Int
    var inningsPitched: Double
    var strikeouts: Int
    var earnedRunAverage: Double
    var wins: Int
    var losses: Int
}

extension Pitcher {
    init?(json: [String: Any]) {
        guard let id = json["id"] as? String,
              let name = json["name"] as? String,
              let team = json["team"] as? String,
              let stats = json["stats"] as? [String: Any],
              let gamesPlayed = stats["gamesPlayed"] as? Int,
              let inningsPitched = stats["inningsPitched"] as? Double,
              let strikeouts = stats["strikeouts"] as? Int,
              let earnedRunAverage = stats["earnedRunAverage"] as? Double,
              let wins = stats["wins"] as? Int,
              let losses = stats["losses"] as? Int
        else {
            return nil
        }
        
        self.id = id
        self.name = name
        self.team = team
        self.stats = PitcherStats(gamesPlayed: gamesPlayed, inningsPitched: inningsPitched, strikeouts: strikeouts, earnedRunAverage: earnedRunAverage, wins: wins, losses: losses)
    }
}