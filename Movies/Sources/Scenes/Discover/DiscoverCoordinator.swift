import UIKit
import RxSwift

final class DiscoverCoordinator: BaseCoordinator<Void> {

  let navigationController: UINavigationController

  init(in navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  override func start() -> Observable<Void> {

    let viewController = DiscoverViewController.make(with: DiscoverViewModel())

    navigationController.isNavigationBarHidden = true

    navigationController.pushViewController(viewController, animated: false)

    return .never()
  }

}
