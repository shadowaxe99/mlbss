import UIKit
import CoreML

class ViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var playerView: PlayerView!
    @IBOutlet weak var pitcherView: PitcherView!
    @IBOutlet weak var hitterView: HitterView!
    @IBOutlet weak var videoUploadView: VideoUploadView!
    @IBOutlet weak var biomechanicsView: BiomechanicsView!
    
    var aiModel: AIModel?
    var videoAnalysis: VideoAnalysis?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize AI Model
        if let aiModelURL = Bundle.main.url(forResource: "AIModel", withExtension: "mlmodelc") {
            do {
                let aiModel = try AIModel(contentsOf: aiModelURL)
                self.aiModel = aiModel
            } catch {
                print("Error loading AI Model: \(error)")
            }
        }
        
        // Initialize Video Analysis
        videoAnalysis = VideoAnalysis()
    }
    
    @IBAction func uploadVideo(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.mediaTypes = ["public.movie"]
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let videoURL = info[.mediaURL] as? URL {
            videoAnalysis?.analyze(videoURL: videoURL) { biomechanics in
                DispatchQueue.main.async {
                    self.biomechanicsView.display(biomechanics: biomechanics)
                }
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func predict(_ sender: Any) {
        guard let player = playerView.getPlayer(), let pitcher = pitcherView.getPitcher(), let hitter = hitterView.getHitter(), let aiModel = aiModel else {
            return
        }
        
        let prediction = aiModel.predict(player: player, pitcher: pitcher, hitter: hitter)
        playerView.display(prediction: prediction)
        pitcherView.display(prediction: prediction)
        hitterView.display(prediction: prediction)
    }
}