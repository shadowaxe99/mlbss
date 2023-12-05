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
        self.stance = prediction.dictionaryValue["stance"]?.stringValue ?? ""
        self.swingSpeed = prediction.dictionaryValue["swingSpeed"]?.doubleValue ?? 0.0
        self.batAngle = prediction.dictionaryValue["batAngle"]?.doubleValue ?? 0.0
        self.strideLength = prediction.dictionaryValue["strideLength"]?.doubleValue ?? 0.0
        self.handPosition = prediction.dictionaryValue["handPosition"]?.stringValue ?? ""
    }
}