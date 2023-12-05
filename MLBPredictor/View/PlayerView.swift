import UIKit

class PlayerView: UIViewController {
    
    var player: Player?
    var aiModel: AIModel?
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var playerStatsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePlayerView()
    }
    
    func updatePlayerView() {
        guard let player = player else { return }
        playerNameLabel.text = player.name
        playerImageView.image = UIImage(named: player.imageName)
        playerStatsLabel.text = "Batting Average: \(player.battingAverage) \nHome Runs: \(player.homeRuns) \nRBIs: \(player.RBIs)"
    }
    
    @IBAction func predictPerformance(_ sender: UIButton) {
        guard let player = player else { return }
        let prediction = aiModel?.predictPerformance(for: player)
        let alertController = UIAlertController(title: "Prediction", message: "The AI predicts that \(player.name) will have a \(prediction?.performanceRating ?? 0) performance tonight.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated: true)
    }
}