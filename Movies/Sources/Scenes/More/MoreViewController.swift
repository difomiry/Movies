import UIKit
import RxSwift
import RxCocoa

final class MoreViewController: ViewController<MoreViewModel> {

  // MARK: - Views

  @IBOutlet private var tableView: UITableView!

  private let settingsButton = UIBarButtonItem(image: UIImage(named: "Settings"), style: .done, target: nil, action: nil)

  // MARK: - Setup

  override func setupViews() {
    super.setupViews()

    navigationItem.rightBarButtonItem = settingsButton
  }

  override func setupThemes() {
    super.setupThemes()

    themes.rx
      .bind({ $0.cellSeparatorColor }, to: tableView.rx.separatorColor)
      .disposed(by: disposeBag)
  }

  override func setupBindings() {
    super.setupBindings()

    settingsButton.rx.tap
      .bind(to: viewModel.tapSettings)
      .disposed(by: disposeBag)
  }

}
