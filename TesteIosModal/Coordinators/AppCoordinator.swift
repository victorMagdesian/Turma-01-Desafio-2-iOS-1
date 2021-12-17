import Foundation
import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow?

    var navController: UINavigationController = {
        let nav = UINavigationController()
        nav.pushViewController(HomeViewController(), animated: true)
        nav.navigationBar.prefersLargeTitles = true
        return nav
    }()

    init(window: UIWindow?) {
        self.window = window

    }

    override func start() {
        guard let window = window else { return }
        home()
        navController.viewControllers.removeAll()
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }

    func home() {
        let child = MainCoordinator(navigationController: navController)
        child.parentCoordinator = self
        addChildCoordinator(child)
        child.start()
    }

}
