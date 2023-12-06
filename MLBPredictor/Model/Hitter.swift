import Foundation

struct Hitter {
    var name: String
    var team: String
    var battingAverage: Double
    var homeRuns: Int
    var RBIs: Int
    var onBasePercentage: Double
    var sluggingPercentage: Double
    var onBasePlusSlugging: Double

    init(name: String, team: String, battingAverage: Double, homeRuns: Int, RBIs: Int, onBasePercentage: Double, sluggingPercentage: Double, onBasePlusSlugging: Double) {
        self.name = name
        self.team = team
        self.battingAverage = battingAverage
        self.homeRuns = homeRuns
        self.RBIs = RBIs
        self.onBasePercentage = onBasePercentage
        self.sluggingPercentage = sluggingPercentage
        self.onBasePlusSlugging = onBasePlusSlugging
    }
    
    func predictPerformance(using model: AIModel) -> Double {
        return model.predictPerformance(forHitter: self)
    }
}
