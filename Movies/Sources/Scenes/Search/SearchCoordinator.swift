import UIKit
import RxSwift
import Swinject

final class SearchCoordinator: BaseCoordinator<Void, UINavigationController> {

  override func start() -> Observable<Void> {

    let viewController = SearchViewController.instantiate()

    viewController.title = "Search"

    context.navigationBar.prefersLargeTitles = true

    context.pushViewController(viewController, animated: false)

    return .never()
  }

}
