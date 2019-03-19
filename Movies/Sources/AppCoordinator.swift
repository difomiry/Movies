import UIKit
import RxSwift
import Swinject

final class AppCoordinator: BaseCoordinator<Void> {

  let window: UIWindow

  init(in window: UIWindow) {
    self.window = window
  }

  override func start() -> Observable<Void> {

    let tabBarController = UITabBarController()

    let navigationController1 = UINavigationController()
    let navigationController2 = UINavigationController()
    let navigationController3 = UINavigationController()

    navigationController1.tabBarItem = UITabBarItem(title: "Discover", image: UIImage(named: "Rocket"), tag: 0)
    navigationController2.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "Search"), tag: 1)
    navigationController3.tabBarItem = UITabBarItem(title: "More", image: UIImage(named: "More"), tag: 2)

    tabBarController.viewControllers = [navigationController1, navigationController2, navigationController3]

    window.rootViewController = tabBarController
    window.makeKeyAndVisible()

    coordinate(to: DiscoverCoordinator(in: navigationController1))
      .subscribe()
      .disposed(by: disposeBag)

    coordinate(to: SearchCoordinator(in: navigationController2))
      .subscribe()
      .disposed(by: disposeBag)

    coordinate(to: MoreCoordinator(in: navigationController3))
      .subscribe()
      .disposed(by: disposeBag)

    return .never()
  }

}
