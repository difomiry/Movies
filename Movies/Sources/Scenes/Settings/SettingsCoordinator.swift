import UIKit
import RxSwift

final class SettingsCoordinator: BaseCoordinator<Void> {

  let navigationController: UINavigationController

  init(in navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  override func start() -> Observable<Void> {

    let viewController = SettingsViewController.make(with: SettingsViewModel())

    viewController.title = "Settings"

    navigationController.pushViewController(viewController, animated: true)

    return .never()
  }

}
