import UIKit
import RxSwift

final class VersionCell: Cell<VersionCellViewModel> {

  // MARK: - Views

  @IBOutlet private var titleLabel: UILabel!

  // MARK: - Binding

  override func bind() {
    if let text = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
      titleLabel.text = "Version \(text)"
    }
  }

  override func setupTheme() {
    super.setupTheme()

    themes.rx
      .bind({ $0.cellForegroundColor }, to: titleLabel.rx.textColor)
      .disposed(by: disposeBag)
  }

}
