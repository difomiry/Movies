import UIKit
import RxSwift
import Swinject

final class MoreCoordinator: Coordinator<Void> {

  let navigationController: UINavigationController

  let resolver: Resolver

  init(in navigationController: UINavigationController, with resolver: Resolver) {
    self.navigationController = navigationController
    self.resolver = resolver
  }

  override func start() -> Observable<Void> {

    let viewController = MoreViewController.instantiate()

    viewController.title = "More"

    navigationController.pushViewController(viewController, animated: false)

    viewController.viewModel.openSettings
      .subscribe(onNext: { [weak self] _ in self?.openSettings() })
      .disposed(by: disposeBag)

    return .never()
  }

  private func openSettings() {
    coordinate(to: resolver.resolve(SettingsCoordinator.self, argument: navigationController)!)
      .subscribe()
      .disposed(by: disposeBag)
  }

}
