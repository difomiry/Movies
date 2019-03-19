import UIKit
import RxSwift

final class SearchCoordinator: BaseCoordinator<Void> {

  let navigationController: UINavigationController

  init(in navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  override func start() -> Observable<Void> {

    let viewController = SearchViewController.make(with: SearchViewModel())

    viewController.title = "Search"

    navigationController.pushViewController(viewController, animated: false)

    return .never()
  }

}
