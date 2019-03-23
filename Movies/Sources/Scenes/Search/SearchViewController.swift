import UIKit
import RxSwift

final class SearchViewController: ViewController<SearchViewModel> {

  // MARK: - Views

  @IBOutlet private var searchBar: UISearchBar!

  @IBOutlet private var tableView: UITableView!

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()

    setupBindings()
  }

}

// MARK: - Setup

extension SearchViewController {

  fileprivate func setupBindings() {

    themes.rx
      .bind({ $0.barStyle }, to: searchBar.rx.barStyle)
      .disposed(by: disposeBag)

    themes.rx
      .bind({ $0.cellSeparatorColor }, to: tableView.rx.separatorColor)
      .disposed(by: disposeBag)
  }

}
