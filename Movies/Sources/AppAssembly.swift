import UIKit
import Swinject
import Moya
import RxTheme

final class AppAssembly: Assembly {

  func assemble(container: Container) {

    container.register(Resolver.self) { _ in container }.inObjectScope(.container)

    container.register(MoyaProvider<TMDB>.self) { _ in .init() }.inObjectScope(.container)

    container.register(Settings.self) { _ in UserDefaults.standard }.inObjectScope(.container)

    container.register(Themes.self) { r in ThemeType.service(initial: r.resolve(Settings.self)!.theme) }.inObjectScope(.container)

    container.autoregister(AppCoordinator.self, argument: UIWindow.self, initializer: AppCoordinator.init)
  }

}
