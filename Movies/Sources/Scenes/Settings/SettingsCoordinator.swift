import UIKit
import RxSwift
import Swinject

final class SettingsCoordinator: BaseCoordinator<Void, UINavigationController> {

  override func start() -> Observable<Void> {

    let viewController = SettingsViewController.instantiate()

    viewController.title = "Settings"

    context.pushViewController(viewController, animated: true)

    return .never()
  }

}
