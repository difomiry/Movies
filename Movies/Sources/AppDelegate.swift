import UIKit
import RxSwift

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  var appCoordinator: AppCoordinator!

  let disposeBag = DisposeBag()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow()

    appCoordinator = AppCoordinator(in: window!)

    appCoordinator.start()
      .subscribe()
      .disposed(by: disposeBag)

    return true
  }

}
