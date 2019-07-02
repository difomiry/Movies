import UIKit
import RxSwift
import Swinject

final class DiscoverCoordinator: BaseCoordinator<Void, UINavigationController> {

  override func start() -> Observable<Void> {

    let viewController = DiscoverViewController.instantiate()

    viewController.title = "Discover"

    context.navigationBar.prefersLargeTitles = true

    context.pushViewController(viewController, animated: false)

    return .never()
  }

}
