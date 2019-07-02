import UIKit
import RxSwift
import RxCocoa

final class SwitchCell: Cell<SwitchCellViewModel> {

  // MARK: - Views

  @IBOutlet private var titleLabel: UILabel!

  private let switchView = UISwitch(frame: .zero)

  override func setupTheme() {
    super.setupTheme()

    accessoryView = switchView

    switchView.isOn = settings.theme == .dark

    themes.rx
      .bind({ $0.cellForegroundColor }, to: titleLabel.rx.textColor)
      .disposed(by: disposeBag)

    switchView.rx.value
      .subscribe(onNext: { [weak self] in self?.themes.switch($0 ? .dark : .light) })
      .disposed(by: disposeBag)

    themes.typeStream
      .subscribe(onNext: { [weak self] in self?.settings.theme = $0 })
      .disposed(by: disposeBag)
  }

}
