import UIKit

class PitcherView: UIViewController {

    var pitcher: Pitcher?
    var aiModel: AIModel?
    
    @IBOutlet weak var pitcherNameLabel: UILabel!
    @IBOutlet weak var predictedPerformanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let pitcher = pitcher else { return }
        pitcherNameLabel.text = pitcher.name
        predictPerformance(for: pitcher)
    }
    
    func predictPerformance(for pitcher: Pitcher) {
        guard let aiModel = aiModel else { return }
        let prediction = aiModel.predictPitcherPerformance(pitcher: pitcher)
        predictedPerformanceLabel.text = "Predicted Performance: \(prediction)"
    }
}