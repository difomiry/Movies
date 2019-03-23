import UIKit
import Swinject
import SwinjectAutoregistration

final class SearchAssembly: Assembly {

  func assemble(container: Container) {

    container.autoregister(SearchCoordinator.self, argument: UINavigationController.self, initializer: SearchCoordinator.init)

    container.autoregister(SearchViewModel.self, initializer: SearchViewModel.init)

    container.storyboardInitCompleted(SearchViewController.self) { r, c in
      c.viewModel = r.resolve(SearchViewModel.self)
    }
  }

}
