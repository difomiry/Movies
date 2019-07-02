import UIKit
import RxSwift

final class SettingsViewController: ViewController<SettingsViewModel> {

  // MARK: - Views

  @IBOutlet private var tableView: UITableView!

  private var tableFooter: UIView!

  // MARK: - Setup

  override func setupViews() {
    super.setupViews()

    tableFooter = UIView(frame: .init(x: 0, y: 0, width: tableView.frame.width, height: 0.5))

    tableView.tableFooterView = tableFooter

    tableView.register(SwitchCell.self)
    tableView.register(VersionCell.self)
  }

  override func setupThemes() {
    super.setupThemes()

    themes.rx
      .bind({ $0.cellSeparatorColor }, to: tableView.rx.separatorColor)
      .disposed(by: disposeBag)

    themes.rx
      .bind({ $0.cellSeparatorColor }, to: tableFooter.rx.backgroundColor)
      .disposed(by: disposeBag)
  }

  override func setupBindings() {
    super.setupBindings()

    viewModel.cells
      .asDriver(onErrorJustReturn: [])
      .drive(tableView.rx.items) { [weak self] table, _, item in
        switch item {
        case .themeSwitcher:
          let cell = table.dequeue() as SwitchCell
          cell.viewModel = .init()
          cell.settings = self?.settings
          cell.themes = self?.themes
          return cell
        case .version:
          let cell = table.dequeue() as VersionCell
          cell.viewModel = .init()
          cell.settings = self?.settings
          cell.themes = self?.themes
          return cell
        }
      }
      .disposed(by: disposeBag)
  }

}
