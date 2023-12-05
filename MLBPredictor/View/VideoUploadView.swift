import UIKit
import AVKit

class VideoUploadView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var videoURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func uploadVideoButtonTapped(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.mediaTypes = ["public.movie"]
        imagePickerController.videoQuality = .typeHigh
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        videoURL = info[UIImagePickerController.InfoKey.mediaURL] as? URL
        dismiss(animated: true, completion: nil)
        
        if let videoURL = videoURL {
            VideoAnalysis.analyzeVideo(url: videoURL) { biomechanics in
                // Handle the biomechanics data
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}