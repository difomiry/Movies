import UIKit
import RxSwift
import RxCocoa

final class MoreViewController: ViewController<MoreViewModel> {

  // MARK: - Views

  @IBOutlet private var tableView: UITableView!

  private let settingsButton = UIBarButtonItem(image: UIImage(named: "Settings"), style: .done, target: nil, action: nil)

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.rightBarButtonItem = settingsButton

    setupBindings()
  }

}

// MARK: - Setup

extension MoreViewController {

  fileprivate func setupBindings() {

    themes.rx
      .bind({ $0.cellSeparatorColor }, to: tableView.rx.separatorColor)
      .disposed(by: disposeBag)

    settingsButton.rx.tap
      .bind(to: viewModel.tapSettings)
      .disposed(by: disposeBag)
  }

}
