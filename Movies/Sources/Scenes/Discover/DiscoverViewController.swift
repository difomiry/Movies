import UIKit
import RxSwift

final class DiscoverViewController: BaseViewController {

  fileprivate var viewModel: DiscoverViewModel!

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white
  }

}

extension DiscoverViewController {

  static func make(with viewModel: DiscoverViewModel) -> DiscoverViewController {
    let viewController = DiscoverViewController()
    viewController.viewModel = viewModel
    return viewController
  }

}
