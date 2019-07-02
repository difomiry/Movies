import UIKit
import Swinject
import SwinjectAutoregistration

final class DiscoverAssembly: Assembly {

  func assemble(container: Container) {

    container.autoregister(DiscoverCoordinator.self, argument: UINavigationController.self, initializer: DiscoverCoordinator.init)

    container.autoregister(DiscoverViewModel.self, initializer: DiscoverViewModel.init)

    container.storyboardInitCompleted(DiscoverViewController.self) { r, c in
      c.viewModel = r.resolve(DiscoverViewModel.self)
      c.settings = r.resolve(Settings.self)
      c.themes = r.resolve(Themes.self)
    }
  }

}
