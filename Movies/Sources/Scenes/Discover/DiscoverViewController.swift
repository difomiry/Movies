import UIKit
import RxSwift

final class DiscoverViewController: ViewController<DiscoverViewModel> {

  // MARK: - Views

  @IBOutlet private var tableView: UITableView!

  // MARK: - Setup

  override func setupThemes() {
    super.setupThemes()

    themes.rx
      .bind({ $0.cellSeparatorColor }, to: tableView.rx.separatorColor)
      .disposed(by: disposeBag)
  }

}
