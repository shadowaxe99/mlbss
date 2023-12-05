import Foundation

struct Player {
    var name: String
    var team: String
    var position: String
    var battingAverage: Double
    var homeRuns: Int
    var runsBattedIn: Int
    var stolenBases: Int
    var onBasePercentage: Double
    var sluggingPercentage: Double
    var videoURL: URL?
    
    init(name: String, team: String, position: String, battingAverage: Double, homeRuns: Int, runsBattedIn: Int, stolenBases: Int, onBasePercentage: Double, sluggingPercentage: Double, videoURL: URL?) {
        self.name = name
        self.team = team
        self.position = position
        self.battingAverage = battingAverage
        self.homeRuns = homeRuns
        self.runsBattedIn = runsBattedIn
        self.stolenBases = stolenBases
        self.onBasePercentage = onBasePercentage
        self.sluggingPercentage = sluggingPercentage
        self.videoURL = videoURL
    }
    
    func analyzePerformance(with model: AIModel) -> PerformancePrediction {
        return model.predictPerformance(for: self)
    }
    
    func analyzeBiomechanics(with videoAnalysis: VideoAnalysis) -> Biomechanics {
        return videoAnalysis.analyze(videoURL: self.videoURL)
    }
}