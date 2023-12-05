import UIKit

class HitterView: UIViewController {

    @IBOutlet weak var hitterNameLabel: UILabel!
    @IBOutlet weak var hitterStatsLabel: UILabel!
    @IBOutlet weak var hitterPredictionLabel: UILabel!
    
    var hitter: Hitter?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateHitterView()
    }

    func updateHitterView() {
        guard let hitter = hitter else { return }
        hitterNameLabel.text = hitter.name
        hitterStatsLabel.text = "AVG: \(hitter.avg) | HR: \(hitter.hr) | RBI: \(hitter.rbi)"
        predictHitterPerformance(hitter: hitter)
    }

    func predictHitterPerformance(hitter: Hitter) {
        let model = AIModel()
        let prediction = model.predictHitterPerformance(hitter: hitter)
        hitterPredictionLabel.text = "Predicted AVG: \(prediction.avg) | Predicted HR: \(prediction.hr) | Predicted RBI: \(prediction.rbi)"
    }
}