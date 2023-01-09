import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    defer {
      self.window?.makeKeyAndVisible()
    }

    let window = UIWindow(windowScene: windowScene)
    self.window = window

    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateInitialViewController()
    window.rootViewController = viewController
  }

}
