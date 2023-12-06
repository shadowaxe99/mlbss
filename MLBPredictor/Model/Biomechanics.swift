import Foundation
import CoreML

struct Biomechanics {
    var stance: String
    var swingSpeed: Double
    var batAngle: Double
    var strideLength: Double
    var handPosition: String
}

extension Biomechanics {
    init(from prediction: MLFeatureValue) {
        // Interpret the MLFeatureValue prediction to initialize the Biomechanics
        self.stance = prediction.dictionaryValue["stance"]?.stringValue ?? "Unknown Stance"
        self.swingSpeed = prediction.dictionaryValue["swingSpeed"]?.doubleValue ?? 0.0
        self.batAngle = prediction.dictionaryValue["batAngle"]?.doubleValue ?? 45.0  // Assuming 45.0 as a default bat angle
        self.strideLength = prediction.dictionaryValue["strideLength"]?.doubleValue ?? 1.0  // Assuming 1.0 as a default stride length
        self.handPosition = prediction.dictionaryValue["handPosition"]?.stringValue ?? "Default Position"
        // Future enhancements: Implement additional logic for biomechanical analysis based on prediction
    }
}
