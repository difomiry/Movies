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
    setupThemes()
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

  fileprivate func setupThemes() {

    themes.rx
      .bind({ $0.cellSeparatorColor }, to: tableView.rx.separatorColor)
      .disposed(by: disposeBag)

    themes.rx
      .bind({ $0.cellSeparatorColor }, to: tableFooter.rx.backgroundColor)
      .disposed(by: disposeBag)
  }

  fileprivate func setupBindings() {

    viewModel.cells
      .asDriver(onErrorJustReturn: [])
      .drive(tableView.rx.items) { table, _, item in
        switch item {
        case .themeSwitcher:
          return table.dequeue() as SwitchCell
        case .version:
          return table.dequeue() as VersionCell
        }
      }
      .disposed(by: disposeBag)
  }

}
