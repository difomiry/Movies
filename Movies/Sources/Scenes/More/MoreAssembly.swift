import UIKit
import Swinject
import SwinjectAutoregistration

final class MoreAssembly: Assembly {

  func assemble(container: Container) {

    container.autoregister(MoreCoordinator.self, argument: UINavigationController.self, initializer: MoreCoordinator.init)

    container.autoregister(MoreViewModel.self, initializer: MoreViewModel.init)

    container.storyboardInitCompleted(MoreViewController.self) { r, c in
      c.viewModel = r.resolve(MoreViewModel.self)
      c.settings = r.resolve(Settings.self)
      c.themes = r.resolve(Themes.self)
    }
  }

}
