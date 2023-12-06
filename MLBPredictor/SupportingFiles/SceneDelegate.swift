import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewController = ViewController()
        window.rootViewController = UINavigationController(rootViewController: viewController)
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Logic to handle when the scene has moved from an inactive state to an active state can be implemented here.
        // For example, refreshing the user interface or restarting paused activities.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Implement logic for when the scene will move from an active state to an inactive state.
        // For instance, pausing ongoing tasks or disabling certain UI elements.
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Insert code here to save data when the scene transitions from the foreground to the background.
        // E.g., save changes in the user's profile, persist game state, or save application state.
    }
}
