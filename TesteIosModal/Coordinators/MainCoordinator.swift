import Foundation
import UIKit

class MainCoordinator: Coordinator {

    weak var parentCoordinator: AppCoordinator?
    var navigationController: UINavigationController?
    var repositoriesStore: [Repository]? = []

    var filters: [UIButton] = []

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

//     ViewModel aqui
    override func start() {
        let viewCont = HomeViewController()
        viewCont.coordinator = self
        navigationController!.pushViewController(viewCont, animated: true)
    }

    func detail(index:Int){
        let vc = DetailsViewController()
        vc.indexRepositoriesStore = index
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func webView(url:URL){
        let vc = WebViewController()
        vc.url = url
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }

    func storeFilters(filters: [UIButton]) {
        self.filters.append(contentsOf: filters)
    }

    func sendBackToHome() {
        start()
    }

    override func finish() {
    }

}
