import UIKit
import RxSwift
import Swinject

final class SettingsCoordinator: Coordinator<Void> {

  let navigationController: UINavigationController

  let resolver: Resolver

  init(in navigationController: UINavigationController, with resolver: Resolver) {
    self.navigationController = navigationController
    self.resolver = resolver
  }

  override func start() -> Observable<Void> {

    let viewController = SettingsViewController.instantiate()

    viewController.title = "Settings"

    navigationController.pushViewController(viewController, animated: true)

    return .never()
  }

}
