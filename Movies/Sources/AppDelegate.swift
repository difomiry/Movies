import UIKit
import RxSwift
import Swinject
import SwinjectStoryboard

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow? = .init()

  private let disposeBag = DisposeBag()

  private let assembler = Assembler(container: SwinjectStoryboard.defaultContainer)

  private lazy var resolver = {
    return assembler.resolver
  }()

  private lazy var appCoordinator: AppCoordinator! = {
    return resolver.resolve(AppCoordinator.self, argument: window!)
  }()

  func application(_: UIApplication, willFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {

    setupDependencies()

    return true
  }

  func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    appCoordinator.start()
      .subscribe()
      .disposed(by: disposeBag)

    return true
  }

}

fileprivate extension AppDelegate {

  func setupDependencies() {
    assembler.apply(assembly: AppAssembly())
    assembler.apply(assembly: DiscoverAssembly())
    assembler.apply(assembly: SearchAssembly())
    assembler.apply(assembly: MoreAssembly())
    assembler.apply(assembly: SettingsAssembly())
  }

}
