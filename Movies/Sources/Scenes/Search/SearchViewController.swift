import UIKit
import RxSwift

final class SearchViewController: BaseViewController {

  fileprivate var viewModel: SearchViewModel!

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white
  }

}

extension SearchViewController {

  static func make(with viewModel: SearchViewModel) -> SearchViewController {
    let viewController = SearchViewController()
    viewController.viewModel = viewModel
    return viewController
  }

}
