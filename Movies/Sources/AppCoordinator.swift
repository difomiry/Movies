import UIKit
import RxSwift
import Swinject

final class AppCoordinator: BaseCoordinator<Void, UIWindow> {

  override func start() -> Observable<Void> {

    let tabBarController = UITabBarController()

    let navigationController1 = fetchNavigationController()
    let navigationController2 = fetchNavigationController()
    let navigationController3 = fetchNavigationController()

    navigationController1.tabBarItem = UITabBarItem(title: "Discover", image: UIImage(named: "Rocket"), tag: 0)
    navigationController2.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "Search"), tag: 1)
    navigationController3.tabBarItem = UITabBarItem(title: "More", image: UIImage(named: "More"), tag: 2)

    tabBarController.viewControllers = [navigationController1, navigationController2, navigationController3]

    context.rootViewController = tabBarController
    context.makeKeyAndVisible()

    coordinate(to: resolver.resolve(DiscoverCoordinator.self, argument: navigationController1)!)
      .subscribe()
      .disposed(by: disposeBag)

    coordinate(to: resolver.resolve(SearchCoordinator.self, argument: navigationController2)!)
      .subscribe()
      .disposed(by: disposeBag)

    coordinate(to: resolver.resolve(MoreCoordinator.self, argument: navigationController3)!)
      .subscribe()
      .disposed(by: disposeBag)

    resolver.resolve(Themes.self)!.attrsStream
      .subscribe(onNext: { theme in
        tabBarController.tabBar.barStyle = theme.barStyle
      })
      .disposed(by: disposeBag)

    return .never()
  }

  fileprivate func fetchNavigationController() -> UINavigationController {

    let navigationController = UINavigationController()

    let themes = resolver.resolve(Themes.self)!

    themes.rx
      .bind({ $0.navigationBarForegroundColor }, to: navigationController.navigationBar.rx.tintColor)
      .disposed(by: disposeBag)

    themes.rx
      .bind({ $0.navigationBarBackgroundColor }, to: navigationController.navigationBar.rx.barTintColor)
      .disposed(by: disposeBag)

    themes.rx
      .bind({ $0.navigationBarTitleTextAttributes }, to: navigationController.navigationBar.rx.titleTextAttributes)

    themes.attrsStream
      .subscribe(onNext: { theme in
        navigationController.navigationBar.largeTitleTextAttributes = theme.navigationBarTitleTextAttributes
      })
      .disposed(by: disposeBag)

    return navigationController
  }

}
