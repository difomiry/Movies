import UIKit
import Swinject
import SwinjectAutoregistration

final class SettingsAssembly: Assembly {

  func assemble(container: Container) {

    container.autoregister(SettingsCoordinator.self, argument: UINavigationController.self, initializer: SettingsCoordinator.init)

    container.autoregister(SettingsViewModel.self, initializer: SettingsViewModel.init)

    container.storyboardInitCompleted(SettingsViewController.self) { r, c in
      c.viewModel = r.resolve(SettingsViewModel.self)
      c.settings = r.resolve(Settings.self)
      c.themes = r.resolve(Themes.self)
    }
  }

}
