import UIKit
import RxSwift

final class DiscoverViewController: ViewController<DiscoverViewModel> {

  // MARK: - Views

  @IBOutlet private var tableView: UITableView!

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()

    setupViews()
    setupThemes()
    setupBindings()
  }

}

// MARK: - Setup

extension DiscoverViewController {

  fileprivate func setupViews() {
  }

  fileprivate func setupThemes() {

    themes.rx
      .bind({ $0.cellSeparatorColor }, to: tableView.rx.separatorColor)
      .disposed(by: disposeBag)
  }

  fileprivate func setupBindings() {
  }

}
