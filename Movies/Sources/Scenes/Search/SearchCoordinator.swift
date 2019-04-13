import UIKit
import RxSwift
import Swinject

final class SearchCoordinator: Coordinator<Void> {

  let navigationController: UINavigationController

  let resolver: Resolver

  init(in navigationController: UINavigationController, with resolver: Resolver) {
    self.navigationController = navigationController
    self.resolver = resolver
  }

  override func start() -> Observable<Void> {

    let viewController = SearchViewController.instantiate()

    viewController.title = "Search"

    navigationController.navigationBar.prefersLargeTitles = true

    navigationController.pushViewController(viewController, animated: false)

    return .never()
  }

}
