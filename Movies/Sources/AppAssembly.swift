import UIKit
import Swinject
import Moya

final class AppAssembly: Assembly {

  func assemble(container: Container) {

    container.register(MoyaProvider<TMDB>.self) { _ in .init() }.inObjectScope(.container)

    container.register(Resolver.self) { _ in container }.inObjectScope(.container)

    container.autoregister(AppCoordinator.self, argument: UIWindow.self, initializer: AppCoordinator.init)
  }

}
