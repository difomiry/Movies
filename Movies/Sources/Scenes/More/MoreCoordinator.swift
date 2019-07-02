import UIKit
import RxSwift
import Swinject

final class MoreCoordinator: BaseCoordinator<Void, UINavigationController> {

  override func start() -> Observable<Void> {

    let viewController = MoreViewController.instantiate()

    viewController.title = "More"

    context.pushViewController(viewController, animated: false)

    viewController.viewModel.openSettings
      .subscribe(onNext: { [weak self] _ in self?.openSettings() })
      .disposed(by: disposeBag)

    return .never()
  }

  private func openSettings() {
    coordinate(to: resolver.resolve(SettingsCoordinator.self, argument: context)!)
      .subscribe()
      .disposed(by: disposeBag)
  }

}
