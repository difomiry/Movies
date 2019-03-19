import UIKit
import RxSwift

final class SettingsViewController: BaseViewController {

  fileprivate var viewModel: SettingsViewModel!

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white
  }

}

extension SettingsViewController {

  static func make(with viewModel: SettingsViewModel) -> SettingsViewController {
    let viewController = SettingsViewController()
    viewController.viewModel = viewModel
    return viewController
  }

}
