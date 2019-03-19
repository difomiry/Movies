import UIKit
import RxSwift

final class MoreCoordinator: BaseCoordinator<Void> {

  let navigationController: UINavigationController

  init(in navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  override func start() -> Observable<Void> {

    let viewModel = MoreViewModel()
    let viewController = MoreViewController.make(with: viewModel)

    viewController.title = "More"

    navigationController.pushViewController(viewController, animated: false)

    viewModel.openSettings
      .subscribe(onNext: { [weak self] _ in self?.openSettings() })
      .disposed(by: disposeBag)

    return .never()
  }

  private func openSettings() {
    coordinate(to: SettingsCoordinator(in: navigationController))
      .subscribe()
      .disposed(by: disposeBag)
  }

}
