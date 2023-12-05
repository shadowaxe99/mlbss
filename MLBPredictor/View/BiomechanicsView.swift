import UIKit

class BiomechanicsView: UIViewController {
    
    var biomechanics: Biomechanics?
    
    @IBOutlet weak var biomechanicsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let biomechanics = biomechanics else { return }
        biomechanicsLabel.text = "Player Biomechanics: \(biomechanics.description)"
    }
    
    @IBAction func analyzeVideo(_ sender: UIButton) {
        guard let videoURL = URL(string: "videoURL") else { return }
        VideoAnalysis.analyzeVideo(url: videoURL) { (biomechanics, error) in
            if let error = error {
                print("Error analyzing video: \(error)")
                return
            }
            
            if let biomechanics = biomechanics {
                self.biomechanics = biomechanics
                self.updateUI()
            }
        }
    }
}