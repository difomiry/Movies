import UIKit
import Swinject

final class AppAssembly: Assembly {

  func assemble(container: Container) {

    container.register(Resolver.self) { _ in container }.inObjectScope(.container)

    container.autoregister(AppCoordinator.self, argument: UIWindow.self, initializer: AppCoordinator.init)
  }

}
