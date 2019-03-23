import UIKit
import RxSwift
import Swinject
import SwinjectStoryboard

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  let resolver = Assembler([
    AppAssembly(),
    DiscoverAssembly(),
    SearchAssembly(),
    MoreAssembly(),
    SettingsAssembly(),
  ], container: SwinjectStoryboard.defaultContainer).resolver

  let disposeBag = DisposeBag()

  var appCoordinator: AppCoordinator!

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow()

    appCoordinator = resolver.resolve(AppCoordinator.self, argument: window!)

    appCoordinator.start()
      .subscribe()
      .disposed(by: disposeBag)

    return true
  }

}
