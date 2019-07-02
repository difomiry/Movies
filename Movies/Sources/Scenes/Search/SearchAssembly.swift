import UIKit
import Swinject
import SwinjectAutoregistration

final class SearchAssembly: Assembly {

  func assemble(container: Container) {

    container.autoregister(SearchCoordinator.self, argument: UINavigationController.self, initializer: SearchCoordinator.init)

    container.autoregister(SearchViewModel.self, initializer: SearchViewModel.init)

    container.autoregister(SearchCellViewModel.self, argument: Search.Result.self, initializer: SearchCellViewModel.init)

    container.storyboardInitCompleted(SearchViewController.self) { r, c in
      c.viewModel = r.resolve(SearchViewModel.self)
      c.settings = r.resolve(Settings.self)
      c.themes = r.resolve(Themes.self)
      c.searchCellViewModelFactory = { container.resolve(SearchCellViewModel.self, argument: $0)! }
    }
  }

}
