import UIKit
import RxSwift
import RxCocoa

final class MoreViewController: BaseViewController {

  fileprivate var viewModel: MoreViewModel!

  private let settingsButton = UIBarButtonItem(image: UIImage(named: "Settings"), style: .done, target: nil, action: nil)

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.rightBarButtonItem = settingsButton

    view.backgroundColor = .white

    settingsButton.rx.tap
      .bind(to: viewModel.tapSettings)
      .disposed(by: disposeBag)
  }

}

extension MoreViewController {

  static func make(with viewModel: MoreViewModel) -> MoreViewController {
    let viewController = MoreViewController()
    viewController.viewModel = viewModel
    return viewController
  }

}
