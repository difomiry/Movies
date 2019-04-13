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

    setupViews()
    setupThemes()
    setupBindings()
  }

}

// MARK: - Setup

extension MoreViewController {

  fileprivate func setupViews() {

    navigationItem.rightBarButtonItem = settingsButton
  }

  fileprivate func setupThemes() {

    themes.rx
      .bind({ $0.cellSeparatorColor }, to: tableView.rx.separatorColor)
      .disposed(by: disposeBag)
  }

  fileprivate func setupBindings() {

    settingsButton.rx.tap
      .bind(to: viewModel.tapSettings)
      .disposed(by: disposeBag)
  }

}
