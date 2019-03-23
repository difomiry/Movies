import UIKit
import RxSwift

final class SettingsViewController: ViewController<SettingsViewModel> {

  // MARK: - Views

  @IBOutlet private var tableView: UITableView!

  private var tableFooter: UIView!

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()

    setupViews()
    setupBindings()
  }

}

// MARK: - Setup

extension SettingsViewController {

  fileprivate func setupViews() {

    tableFooter = UIView(frame: .init(x: 0, y: 0, width: tableView.frame.width, height: 0.5))

    tableView.tableFooterView = tableFooter

    tableView.register(SwitchCell.self)
    tableView.register(VersionCell.self)
  }

  fileprivate func setupBindings() {

    viewModel.cells
      .bind(to: tableView.rx.items) { tableView, _, item in
        switch item {
        case .themeSwitcher:
          return tableView.dequeue() as SwitchCell
        case .version:
          return tableView.dequeue() as VersionCell
        }
      }
      .disposed(by: disposeBag)

    themes.rx
      .bind({ $0.cellSeparatorColor }, to: tableView.rx.separatorColor)
      .disposed(by: disposeBag)

    themes.rx
      .bind({ $0.cellSeparatorColor }, to: tableFooter.rx.backgroundColor)
      .disposed(by: disposeBag)
  }

}
